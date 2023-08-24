import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:dictionary_web/controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      onLogin: controller.onLogin,
      onSignup: controller.onSignup,
      onRecoverPassword: (_) => null,
      messages: LoginMessages(
        userHint: 'E-mail',
        passwordHint: 'Password',
        confirmPasswordHint: 'Confirm',
        loginButton: 'LOG IN',
        signupButton: 'SIGN UP',
        confirmPasswordError: 'Not match!',
      ),
    );
  }
}
