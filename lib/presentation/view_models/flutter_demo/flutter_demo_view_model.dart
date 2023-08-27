import 'dart:async';

import 'package:flutter_doctors_demo/presentation/navigation/navigation_handler.dart';
import 'package:flutter_doctors_demo/presentation/view_models/base/base_view_model.dart';
import 'package:flutter_doctors_demo/presentation/view_models/flutter_demo/flutter_demo_state.dart';

class FlutterDemoViewModel extends BaseViewModel<FlutterDemoState> {
  FlutterDemoViewModel({
    required this.navigationHandler,
  }) : super(FlutterDemoState.initial());

  final NavigationHandler navigationHandler;

  @override
  Future<void> dispose() async {
    super.dispose();
  }

  @override
  void onInit() {}

  Future<void> init() async {}
}
