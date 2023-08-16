import 'package:dictionary_web/page/first_page.dart';
import 'package:dictionary_web/page/login_page.dart';
import 'package:dictionary_web/service/auth.dart';
import 'package:get/get.dart';

import '../models/news.dart';

class LoginController extends GetxController {
  late AuthService authService;
  @override
  void onInit() {
    super.onInit();
    authService = AuthService();
  }

  Future<void> errorMesaggeControl(String email, String password) async {
    String message = authService.signIn(email, password).toString();
    print(message.toString());
    if (message == "_Future<String?>") {
      Get.to(FirstPage());
    } else if (message == "1") {
      Get.snackbar("Hata", "Bilgilerinizi kontrol edin");
      Get.to(FirstPage());
    }
  }

  void changeisExpanded(News item){
    item.isExpanded = !item.isExpanded;
  }
}
