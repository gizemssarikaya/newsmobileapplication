import 'package:dio/dio.dart';

import '../models/news.dart';

class NewsService {
  late Dio dio;

  NewsService() {
    dio = Dio();
  }

  Future<List<News>> getNews() async {
    final newsList = <News>[];

    final response = await dio.get("https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=opyjc45w8PyS7pAcJGGX2frsi3xQQuz0");

    if (response.statusCode == 200) {
      final data = response.data['results'] as List<dynamic>;

      for (final item in data) {
        final model = News.fromJson(item);

        newsList.add(model);
      }
    }

    return newsList;
  }
}
