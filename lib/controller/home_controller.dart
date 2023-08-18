import 'package:dictionary_web/service/news_service.dart';
import 'package:get/get.dart';

import '../models/news.dart';

class HomeController extends GetxController {
  final newsList = RxList<News>([]);
  final Map<int, RxBool> isExpandedMap = {};

  final _isExpanded = RxBool(true);

  bool get isExpanded => _isExpanded.value;

  set isExpanded(bool value) => _isExpanded.value = value;

  late NewsService service;

  @override
  Future<void> onInit() async {
    super.onInit();

    service = NewsService();
    await loadNews();
  }

  Future<void> loadNews() async {
    final news = await service.getNews();

    newsList.clear();
    newsList.addAll(news);
  }

  void changeisExpanded(bool status) {
    isExpanded = !status;
  }
}
