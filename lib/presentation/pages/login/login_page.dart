import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_doctors_demo/navigation.dart';
import 'package:flutter_doctors_demo/presentation/components/components.dart';
import 'package:flutter_doctors_demo/presentation/pages/login/result_state.dart';
import 'package:flutter_doctors_demo/presentation/theme/colors.dart';
import 'package:flutter_doctors_demo/presentation/theme/font_alias.dart';
import 'package:flutter_doctors_demo/presentation/theme/spacing_alias.dart';
import 'package:flutter_doctors_demo/presentation/view_models/login/login_provider.dart';
import 'package:flutter_doctors_demo/utils/constants/app_strings.dart';
import 'package:flutter_doctors_demo/utils/validation/validate_util.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passDataController =
      TextEditingController(text: "");
  final channelAndroid = MethodChannel("android");
  final channelIos = MethodChannel("ios");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginProvider);
    final viewModel = ref.watch(loginProvider.notifier);

    final result = ref.watch(resultProvider);
    final enableButton = useMemoized(
        () =>
            !ValidateUtil.isNullOrEmpty(state.email) ||
            !ValidateUtil.isNullOrEmpty(state.password),
        [state.email, state.password]);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: SpacingAlias.Spacing15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   alignment: Alignment.center,
              //   width: double.infinity,
              //   child: LabelCustom(
              //     padding: EdgeInsets.zero,
              //     label: AppStrings.loginLabel,
              //     fontSize: FontAlias.fontAlias28,
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
              // SpacingAlias.SizeHeight32,
              // LabelCustom(
              //   padding: EdgeInsets.zero,
              //   label: AppStrings.loginTitleLabel,
              //   fontSize: FontAlias.fontAlias12,
              //   fontWeight: FontWeight.w400,
              // ),
              // SpacingAlias.SizeHeight8,
              // TextFormFieldCustom(
              //   controller: emailController,
              //   onChanged: viewModel.onEmailChange,
              //   suffixIcon: !ValidateUtil.isNullOrEmpty(state.email)
              //       ? CircleIconButton(
              //           onPressed: () {
              //             emailController.clear();
              //             viewModel.onEmailChange("");
              //           },
              //           icon: Icons.clear,
              //         )
              //       : null,
              // ),
              // SpacingAlias.SizeHeight32,
              // LabelCustom(
              //   padding: EdgeInsets.zero,
              //   label: AppStrings.passwordLabel,
              //   fontSize: FontAlias.fontAlias12,
              //   fontWeight: FontWeight.w400,
              // ),
              // SpacingAlias.SizeHeight8,
              // TextFormFieldCustom(
              //   controller: passwordController,
              //   obscureText: true,
              //   onChanged: viewModel.onPasswordChange,
              //   suffixIcon: !ValidateUtil.isNullOrEmpty(state.password)
              //       ? CircleIconButton(
              //           onPressed: () {
              //             passwordController.clear();
              //             viewModel.onPasswordChange("");
              //           },
              //           icon: Icons.clear,
              //         )
              //       : null,
              // ),
              // SpacingAlias.SizeHeight16,
              // Container(
              //   width: double.infinity,
              //   height: 60,
              //   alignment: Alignment.center,
              //   child: LabelCustom(
              //     padding: EdgeInsets.zero,
              //     textAlign: TextAlign.center,
              //     label: viewModel.getErrorMessage(),
              //     fontSize: FontAlias.fontAlias12,
              //     color: AppColors.redError,
              //     fontWeight: FontWeight.w400,
              //   ),
              // ),
              // SpacingAlias.SizeHeight20,
              // Container(
              //   width: double.infinity,
              //   alignment: Alignment.center,
              //   child: InkWell(
              //     onTap: viewModel.forgotPasswordAction,
              //     child: LabelCustom(
              //       padding: EdgeInsets.zero,
              //       textAlign: TextAlign.center,
              //       label: AppStrings.forgotPasswordLabel,
              //       fontSize: FontAlias.fontAlias12,
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),
              // ),
              // SpacingAlias.SizeHeight20,
              // FlatButtonComponent(
              //   enabled: enableButton,
              //   title: AppStrings.loginLabel,
              //   fontWeight: FontWeight.bold,
              //   fontSize: FontAlias.fontAlias18,
              //   onPressed: () async {
              //     final isLoginSuccess = await viewModel.loginAction();
              //     if (isLoginSuccess) {
              //       emailController.clear();
              //       passwordController.clear();
              //     }
              //   },
              // ),
              // SpacingAlias.SizeHeight20,
              Platform.isAndroid
                  ? FlatButtonComponent(
                      enabled: true,
                      title: AppStrings.goToKotlin,
                      fontWeight: FontWeight.bold,
                      fontSize: FontAlias.fontAlias18,
                      onPressed: () async {
                        final result =
                            await channelAndroid.invokeMethod('navigate');
                        ref.read(resultProvider.notifier).setResult(result);
                        print(result);
                      },
                    )
                  : FlatButtonComponent(
                      enabled: true,
                      title: AppStrings.goToIos,
                      fontWeight: FontWeight.bold,
                      fontSize: FontAlias.fontAlias18,
                      onPressed: () async {
                        final result =
                            await channelIos.invokeMethod('navigate');
                        ref.read(resultProvider.notifier).setResult(result);
                        print(result);
                      },
                    ),
              SpacingAlias.SizeHeight20,
              TextFormFieldCustom(
                controller: passDataController,
                borderRadius: 5,
              ),
              SpacingAlias.SizeHeight10,
              FlatButtonComponent(
                enabled: true,
                title: AppStrings.passData,
                fontWeight: FontWeight.bold,
                fontSize: FontAlias.fontAlias18,
                onPressed: () async {
                  dynamic result;
                  final String value = passDataController.text;
                  if (value.isEmpty) {
                    return;
                  }
                  // await NavigationAPI().passData(passDataController.text);
                  if (Platform.isAndroid) {
                    result =
                        await channelAndroid.invokeMethod('passData', value);
                  } else {
                    result = await channelIos.invokeMethod('passData', value);
                  }
                  ref.read(resultProvider.notifier).setResult(result);
                  print(result);
                },
              ),
              SpacingAlias.SizeHeight20,
              Center(
                  child: Text(
                "data from native: $result",
                style: TextStyle(fontSize: 20),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
