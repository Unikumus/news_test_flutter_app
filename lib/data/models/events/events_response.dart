// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../../domain/models/events/event_model.dart';
import '../base_response.dart';

part 'events_response.g.dart';

@JsonSerializable()
class EventsResponse extends BaseListResponse {
  EventsResponse({
    this.events = const [],
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

  factory EventsResponse.fromJson(Map<String, dynamic>? json) => _$EventsResponseFromJson(json ?? {});

  @JsonKey(name: 'data')
  final List<EventModel> events;
}
