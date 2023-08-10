// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  final String title;
  final DateTime timeStamp;
  final int readTime;
  final String imageUrl;
  final String thumbnailUrl;
  final String content;
  final String category;

  const NewsModel({
    required this.title,
    required this.timeStamp,
    required this.readTime,
    required this.imageUrl,
    required this.thumbnailUrl,
    required this.content,
    required this.category,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);
}
