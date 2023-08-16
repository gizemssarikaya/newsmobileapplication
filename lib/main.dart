import 'package:dictionary_web/page/first_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/login_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB2N7eNGw0CSPcTnH3w14PGYXMKdYhHYmY",
          appId: "1:1022129170611:web:5645f316c0daeb703628c6",
          messagingSenderId: "1022129170611",
          projectId: "dictionary-45f24"));
  setupDependency();

  runApp(const MyApp());
}

void setupDependency() {
  Get.put<LoginController>(LoginController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FirstPage(),
    );
  }
}
