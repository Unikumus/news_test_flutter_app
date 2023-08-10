// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:test_news_flutter_app/domain/models/user/user_model.dart';
import '../base_response.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends BaseResponse {
  UserResponse({
    super.errors,
    super.success,
    this.data,
  });

  factory UserResponse.fromJson(Map<String, dynamic>? json) => _$UserResponseFromJson(json ?? {});

  final UserModel? data;
}
