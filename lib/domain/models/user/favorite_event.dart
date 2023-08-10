// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'favorite_event.g.dart';

@JsonSerializable()
class FavoriteEvent {
  final int id;
  final String role;

  const FavoriteEvent({
    required this.id,
    required this.role,
  });

  factory FavoriteEvent.fromJson(Map<String, dynamic> json) => _$FavoriteEventFromJson(json);
}
