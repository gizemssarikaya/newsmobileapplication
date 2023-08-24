import 'package:dictionary_web/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/home_controller.dart';
import 'controller/login_controller.dart';
import 'views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCwD5VCco9j6XKt5sz2ifuhs-qtFEIyjZk",
          appId: "1:736686316562:web:7940fbfbbafd7925ed0ccb",
          messagingSenderId: "736686316562",
          projectId: "nytimesnews-ae134"));
  setupDependency();

  runApp(const MyApp());
}

late HomeController homeController;

void setupDependency() {
  homeController = Get.put<HomeController>(HomeController());

  Get.put<LoginController>(LoginController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    homeController.checkUser();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: homeController.initialRoute,
      getPages: [
        GetPage(name: '/', page: () => const HomeView()),
        GetPage(name: '/login', page: () => const LoginView()),
      ],
    );
  }
}
