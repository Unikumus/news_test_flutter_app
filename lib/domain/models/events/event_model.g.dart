// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      id: json['id'] as int,
      title: json['title'] as String,
      period: json['period'] as String,
      imageUrl: json['imageUrl'] as String,
      location: json['location'] as String,
      place: json['place'] as String,
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'period': instance.period,
      'imageUrl': instance.imageUrl,
      'location': instance.location,
      'place': instance.place,
    };
