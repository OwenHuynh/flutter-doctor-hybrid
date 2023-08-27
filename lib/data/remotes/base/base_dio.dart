import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_doctors_demo/config/flavors.dart';
import 'package:flutter_doctors_demo/data/remotes/base/api_constants.dart';
import 'package:flutter_doctors_demo/data/remotes/base/interceptor/logging_interceptor.dart';

class BaseDio {
  BaseDio._();

  static BaseDio? _instance;

  static BaseDio getInstance() {
    return _instance ??= BaseDio._();
  }

  Dio getBaseDio() {
    final Dio dio = Dio();
    (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    dio.options = BaseOptions(receiveTimeout: 15000, connectTimeout: 15000);
    dio.options.headers[ApiConstants.acceptHeader] =
        ApiConstants.applicationJson;
    if (F.isDev || F.isStg) {
      dio.interceptors.add(LoggingInterceptor());
    }
    return dio;
  }

  dynamic _parseAndDecode(String response) {
    return jsonDecode(response);
  }

  dynamic parseJson(String text) {
    return compute(_parseAndDecode, text);
  }
}
