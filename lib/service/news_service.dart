import 'package:dictionary_web/models/news.dart';
import 'package:dio/dio.dart';

class news_Service {
  late Dio dio;
  late List<dynamic> items;
  late List<News> objects;
  news_Service()  {
    dio = Dio();
    items = [];
    objects = [];
    initializeService();
  }

  Future<void> initializeService() async {
    await getHttp();
    await resultstomap();
  }

  List items2 = [];

  Future getHttp() async {
    var response = await dio.get(
        "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=opyjc45w8PyS7pAcJGGX2frsi3xQQuz0");

    items = response.data['results'];
  }

  Future resultstomap() async {
    print('service' );
    print(items.length);
    for (int i = 0; i < items.length; i++) {
      final object = News(
          id: items[i]['id'],
          title: items[i]['title'],
          abstract: items[i]['abstract']);
      objects.add(object);
    }
  }
}
