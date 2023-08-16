
import 'package:json_annotation/json_annotation.dart';
part 'news.g.dart';
@JsonSerializable()
class News{
  int id;
  bool isExpanded;
  String title;
  String abstract;

  News({this.isExpanded =false ,required this.id,required this.title,required this.abstract});

    factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);

  
}