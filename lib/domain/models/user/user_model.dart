// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'favorite_event.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String name;
  final String secondName;
  final String avatar;
  final List<FavoriteEvent> favoritesEvent;

  const UserModel({
    required this.id,
    required this.name,
    required this.secondName,
    required this.avatar,
    required this.favoritesEvent,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
