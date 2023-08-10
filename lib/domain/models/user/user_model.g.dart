// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      secondName: json['secondName'] as String,
      avatar: json['avatar'] as String,
      favoritesEvent: (json['favoritesEvent'] as List<dynamic>)
          .map((e) => FavoriteEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'secondName': instance.secondName,
      'avatar': instance.avatar,
      'favoritesEvent': instance.favoritesEvent,
    };
