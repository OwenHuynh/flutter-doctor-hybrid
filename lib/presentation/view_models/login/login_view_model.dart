import 'dart:async';

import 'package:flutter_doctors_demo/presentation/navigation/app_router.gr.dart';
import 'package:flutter_doctors_demo/presentation/navigation/navigation_handler.dart';
import 'package:flutter_doctors_demo/presentation/view_models/base/base_view_model.dart';
import 'package:flutter_doctors_demo/presentation/view_models/login/login_state.dart';
import 'package:flutter_doctors_demo/presentation/view_models/login/login_validate.dart';
import 'package:flutter_doctors_demo/utils/constants/app_strings.dart';

class LoginViewModel extends BaseViewModel<LoginState> {
  LoginViewModel({required this.navigationHandler}) : super(LoginState());

  final NavigationHandler navigationHandler;

  @override
  Future<void> onInit() async {}

  void onEmailChange(String email) {
    setState((state) => state.copyWith(email: email));
  }

  void onPasswordChange(String password) {
    setState((state) => state.copyWith(password: password));
  }

  String getErrorMessage() {
    switch (state.formStatus) {
      case FormStatus.initial:
        return AppStrings.empty;
      case FormStatus.invalid:
        return AppStrings.loginErrorLabel;
      case FormStatus.valid:
        return AppStrings.empty;
    }
  }

  Future<bool> loginAction() async {
    
    bool loginSuccess = false;
    final emailValid =
        LoginValidationResults.validateEmail(state.email).isValid;

    final passwordValid =
        LoginValidationResults.validatePassword(state.password).isValid;

    final isFormValid = emailValid && passwordValid;

    setState((state) => state.copyWith(
        formStatus: isFormValid ? FormStatus.valid : FormStatus.invalid));

    if (isFormValid) {
      await navigationHandler.reset(route: InitPageRoute());
      loginSuccess = true;
    }
    return loginSuccess;
  }

  void forgotPasswordAction() {}
}
