// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel {
  final int id;
  final String title;
  final String period;
  final String imageUrl;
  final String location;
  final String place;

  const EventModel({
    required this.id,
    required this.title,
    required this.period,
    required this.imageUrl,
    required this.location,
    required this.place,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => _$EventModelFromJson(json);
}
