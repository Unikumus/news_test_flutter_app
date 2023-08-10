// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventsResponse _$EventsResponseFromJson(Map<String, dynamic> json) =>
    EventsResponse(
      events: (json['data'] as List<dynamic>?)
              ?.map((e) => EventModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      success: json['success'] as bool? ?? true,
      errors: (json['errors'] as List<dynamic>?)
              ?.map(
                  (e) => BaseResponseError.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      page: json['page'] as int? ?? 0,
      total: json['total'] as int? ?? 0,
      limit: json['limit'] as int? ?? 0,
    );

Map<String, dynamic> _$EventsResponseToJson(EventsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'errors': instance.errors,
      'page': instance.page,
      'total': instance.total,
      'limit': instance.limit,
      'data': instance.events,
    };
