// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      title: json['title'] as String,
      timeStamp: DateTime.parse(json['timeStamp'] as String),
      readTime: json['readTime'] as int,
      imageUrl: json['imageUrl'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      content: json['content'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'title': instance.title,
      'timeStamp': instance.timeStamp.toIso8601String(),
      'readTime': instance.readTime,
      'imageUrl': instance.imageUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'content': instance.content,
      'category': instance.category,
    };
