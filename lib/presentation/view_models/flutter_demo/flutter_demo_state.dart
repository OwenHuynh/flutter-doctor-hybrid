import 'package:flutter_doctors_demo/presentation/view_models/base/base_state.dart';
import 'package:flutter_doctors_demo/utils/base/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flutter_demo_state.freezed.dart';

@freezed
class FlutterDemoState with _$FlutterDemoState implements BaseState {
  factory FlutterDemoState({
    required PageState pageState,
    required bool isLogged,
  }) = _FlutterDemoState;

  factory FlutterDemoState.initial() => FlutterDemoState(
        isLogged: false,
        pageState: PageState.initial,
      );
}
