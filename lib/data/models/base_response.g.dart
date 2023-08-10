// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseError _$BaseResponseErrorFromJson(Map<String, dynamic> json) =>
    BaseResponseError(
      type: json['type'] as String? ?? '',
      code: json['code'] == null ? '' : toStringOrNull(json['code']),
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$BaseResponseErrorToJson(BaseResponseError instance) =>
    <String, dynamic>{
      'type': instance.type,
      'code': instance.code,
      'message': instance.message,
    };

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      success: json['success'] as bool? ?? true,
      errors: (json['errors'] as List<dynamic>?)
              ?.map(
                  (e) => BaseResponseError.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'errors': instance.errors,
    };

MapBaseResponse _$MapBaseResponseFromJson(Map<String, dynamic> json) =>
    MapBaseResponse(
      success: json['success'] as bool? ?? true,
      errors: (json['errors'] as List<dynamic>?)
              ?.map(
                  (e) => BaseResponseError.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MapBaseResponseToJson(MapBaseResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'errors': instance.errors,
      'data': instance.data,
    };

StringBaseResponse _$StringBaseResponseFromJson(Map<String, dynamic> json) =>
    StringBaseResponse(
      success: json['success'] as bool? ?? true,
      errors: (json['errors'] as List<dynamic>?)
              ?.map(
                  (e) => BaseResponseError.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      data: json['data'] as String?,
    );

Map<String, dynamic> _$StringBaseResponseToJson(StringBaseResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'errors': instance.errors,
      'data': instance.data,
    };

BoolResponse _$BoolResponseFromJson(Map<String, dynamic> json) => BoolResponse(
      success: json['success'] as bool? ?? true,
      errors: (json['errors'] as List<dynamic>?)
              ?.map(
                  (e) => BaseResponseError.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      done: json['done'] as bool? ?? false,
    );

Map<String, dynamic> _$BoolResponseToJson(BoolResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'errors': instance.errors,
      'done': instance.done,
    };
