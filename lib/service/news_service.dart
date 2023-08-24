// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:dio/dio.dart';
import '../models/news.dart';

class NewsService {
  late Dio dio;

  NewsService() {
    dio = Dio();
  }

  Future<List<News>> getNews() async {
    News model;
    var smallPicture;
    var bigPicture;
    final newsList = <News>[];

    final response = await dio.get(
        "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=opyjc45w8PyS7pAcJGGX2frsi3xQQuz0");

    if (response.statusCode == 200) {
      final data = response.data['results'] as List<dynamic>;

      for (final item in data) {
        final mediaList = item['media'] as List<dynamic>;

        for (final media in mediaList) {
          final metadataList = media['media-metadata'] as List<dynamic>;

          if (metadataList.isNotEmpty) {
            final metadata = metadataList[0];
            smallPicture = metadata['url'] as String;
            final metadataBig = metadataList[2];
            bigPicture = metadataBig['url'] as String;
          }

          model = News(
              id: item['id'] as int,
              abstract: item['abstract'] as String,
              title: item['title'] as String,
              smallPicture: smallPicture,
              bigPicture: bigPicture,
              publishedDate: item['published_date'] as String);
          newsList.add(model);
        }
      }
    }

    return newsList;
  }
}
