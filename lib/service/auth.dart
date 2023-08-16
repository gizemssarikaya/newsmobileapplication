import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  late FirebaseAuth auth;
  AuthService() {
    auth = FirebaseAuth.instance;
  }

  Future<String?> signIn(String email, String password) async {
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      return null;
    } on FirebaseAuthException catch (exception) {
      debugPrint(exception.toString());

      return 'Hata çıktı';
    } on Exception catch (exception) {
      debugPrint(exception.toString());

      return 'Hata çıktı';
    }
  }

  Future<String?> createPerson(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);

    return null;
  }

  signout() async {
    return await auth.signOut();
  }
}
