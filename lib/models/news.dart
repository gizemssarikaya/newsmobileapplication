import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  int? id;
  String title;
  String abstract;
  String publishedDate;
  String smallPicture;
  String bigPicture;

  News(
      {this.id,
      required this.title,
      required this.abstract,
      required this.publishedDate,
      required this.smallPicture,
      required this.bigPicture});

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
