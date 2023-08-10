// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      errors: (json['errors'] as List<dynamic>?)
              ?.map(
                  (e) => BaseResponseError.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      success: json['success'] as bool? ?? true,
      data: json['data'] == null
          ? null
          : UserModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'errors': instance.errors,
      'data': instance.data,
    };
