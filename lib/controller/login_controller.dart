import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late FirebaseAuth auth;


  @override
  void onInit() {
    super.onInit();

    auth = FirebaseAuth.instance;
  }

  Future<String?>? onLogin(LoginData data) async {
    UserCredential credential;

    try {
      credential = await auth.signInWithEmailAndPassword(
          email: data.name, password: data.password);

      if (credential.user == null) {
        return "Kullanici giriş yapamadi!";
      } else {
        debugPrint("Kullanici giriş yapti");
        Get.toNamed('/');
      }
    } on FirebaseAuthException catch (exception) {

      final String errorCode=exception.code.toString();
      if(errorCode=="wrong-password"){
        return "Şifre yanlış!";
      }
      else if(errorCode == "user-not-found"){
        return "Hatali email!";
      }

      return 'Hata!ı';
    } on Exception catch (e) {
      debugPrint('hata ${e.toString()}');

      return 'Hata!';
    }

    return null;
  }

  Future<String?>? onSignup(SignupData data) async {
    UserCredential credential;

    if (data.name != null && data.password != null) {
      if (data.password!.length < 6) {
        return 'Şifre 6 karakterden az olamaz!';
      }

      try {
        credential = await auth.createUserWithEmailAndPassword(
          email: data.name!,
          password: data.password!,
        );

        if (credential.user == null) {
          return 'Kullanici Oluşturulamadi';
        } else {
          debugPrint('Tebrikler kullanici oluşturuldu');
          Get.toNamed('/');
          return null;
        }
      } on FirebaseAuthException catch (exception) {
        final String errorCode=exception.code.toString();
        if(errorCode=="email-already-in-use"){
          return "Bu email zaten kayıtlı!";
        }


        return 'Hata!';
      } on Exception catch (exception) {
        debugPrint('Hata!: ${exception.toString()}');

        return 'Hata!';
      }
    } else {
      return 'Email ve Şifre boş gelmemeli!';
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
    Get.toNamed('/login');
  }
}
