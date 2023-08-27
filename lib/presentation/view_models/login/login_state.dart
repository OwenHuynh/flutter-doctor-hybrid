import 'package:flutter_doctors_demo/presentation/view_models/base/base_state.dart';
import 'package:flutter_doctors_demo/utils/base/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState implements BaseState {
  factory LoginState({
    @Default('') String email,
    String? emailError,
    @Default('') String password,
    String? passwordError,
    @Default(PageState.initial) PageState pageState,
    @Default(FormStatus.initial) FormStatus formStatus,
  }) = _LoginState;
}

enum FormStatus { initial, invalid, valid }
