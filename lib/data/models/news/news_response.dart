// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../../domain/models/news/news_model.dart';
import '../base_response.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse extends BaseListResponse {
  NewsResponse({
    this.news = const [],
    bool success = true,
    List<BaseResponseError> errors = const [],
    int page = 0,
    int total = 0,
    int limit = 0,
  }) : super(
          errors: errors,
          success: success,
          page: page,
          total: total,
          limit: limit,
        );

  factory NewsResponse.fromJson(Map<String, dynamic>? json) => _$NewsResponseFromJson(json ?? {});

  @JsonKey(name: 'data')
  final List<NewsModel> news;
}
