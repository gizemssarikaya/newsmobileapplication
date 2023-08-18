// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      id: json['id'] as int?,
      title: json['title'] as String,
      abstract: json['abstract'] as String,
      publishedDate: json['published_date'] as String,
      smallPicture: json['smallPicture'] as String,
      bigPicture: json['bigPicture'] as String,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'abstract': instance.abstract,
      'published_date': instance.publishedDate,
      'smallPicture': instance.smallPicture,
      'bigPicture': instance.bigPicture,
    };
