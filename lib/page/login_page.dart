import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:dictionary_web/controller/login_controller.dart';

// ignore: must_be_immutable
class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});
  @override
  late LoginController controller;
  @override
  Widget build(BuildContext context) {
    controller = Get.put(LoginController());
    return FlutterLogin(
      onLogin: onLogin,
      onSignup: onSignup,
      onRecoverPassword: onRecovery,
      messages: LoginMessages(
        userHint: 'E-mail',
        passwordHint: 'Password',
        confirmPasswordHint: 'Confirm',
        loginButton: 'LOG IN',
        signupButton: 'SIGN UP',
        forgotPasswordButton: 'Forgot password?',
        recoverPasswordButton: 'HELP ME',
        confirmPasswordError: 'Not match!',
        recoverPasswordSuccess: 'Password rescued successfully',
      ),
    );
  }

  Future<String?>? onLogin(LoginData data) async {
    await controller.errorMesaggeControl(data.name, data.password);
    // await authService.signIn(data.name, data.password);
    return null;
  }

  Future<String?>? onSignup(SignupData data) async {
    //  await authService.createPerson(data.name!, data.password!);
    return null;
  }

  Future<String?>? onRecovery(String value) {
    return null;
  }
}
