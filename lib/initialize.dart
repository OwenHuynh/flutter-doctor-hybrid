import 'package:flutter/cupertino.dart';
import 'package:flutter_doctors_demo/utils/shared_preferences_util.dart';
import 'package:intl/intl.dart';

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesUtil.getInstance();
  Intl.defaultLocale = 'ja';
}
