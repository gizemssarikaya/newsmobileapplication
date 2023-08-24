import 'package:dictionary_web/service/news_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/news.dart';
import 'login_controller.dart';

class HomeController extends GetxController {
  late FirebaseAuth auth;

  final newsList = RxList<News>([]);

  late NewsService service;

  final _initialRoute = RxString('/');

  String get initialRoute => _initialRoute.value;

  set initialRoute(String value) => _initialRoute.value = value;

  late LoginController loginController;

  @override
  Future<void> onInit() async {
    super.onInit();

    auth = FirebaseAuth.instance;
    loginController = Get.put<LoginController>(LoginController());

    service = NewsService();
    await loadNews();
  }

  void checkUser() {
    final user = auth.currentUser;

    if (user == null) {
      initialRoute = '/login';
    }
  }

  Future<void> loadNews() async {
    final news = await service.getNews();

    newsList.clear();
    newsList.addAll(news);
  }

  Future<void> signOut() async{
   await loginController.signOut();
  }
}
