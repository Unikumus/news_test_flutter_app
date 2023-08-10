// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

String toStringOrNull(dynamic val) => val?.toString() ?? '';

@JsonSerializable()
class BaseResponseError {
  BaseResponseError({this.type = '', this.code = '', this.message = ''});

  factory BaseResponseError.fromJson(Map<String, dynamic> json) => _$BaseResponseErrorFromJson(json);

  final String type;
  @JsonKey(fromJson: toStringOrNull)
  final String code;
  final String message;
}

@JsonSerializable()
class BaseResponse {
  BaseResponse({this.success = true, this.errors = const []});

  factory BaseResponse.fromJson(Map<String, dynamic>? json) => _$BaseResponseFromJson(json ?? {});

  final bool success;
  final List<BaseResponseError> errors;

  String get errorMessages => errors.isNotEmpty
      ? errors.fold('', (previousValue, errorResponse) => '$previousValue${errorResponse.message}\n')
      : '';
}

class BaseListResponse extends BaseResponse {
  BaseListResponse({
    bool success = true,
    List<BaseResponseError> errors = const [],
    this.page = 0,
    this.total = 0,
    this.limit = 0,
  }) : super(
          errors: errors,
          success: success,
        );

  final int page;
  final int total;
  final int limit;
}

@JsonSerializable()
class MapBaseResponse extends BaseResponse {
  MapBaseResponse({bool success = true, List<BaseResponseError> errors = const [], this.data})
      : super(success: success, errors: errors);

  factory MapBaseResponse.fromJson(Map<String, dynamic> json) => _$MapBaseResponseFromJson(json);

  final Map<String, dynamic>? data;
}

@JsonSerializable()
class StringBaseResponse extends BaseResponse {
  StringBaseResponse({bool success = true, List<BaseResponseError> errors = const [], this.data})
      : super(success: success, errors: errors);

  factory StringBaseResponse.fromJson(Map<String, dynamic> json) => _$StringBaseResponseFromJson(json);

  final String? data;
}

@JsonSerializable()
class BoolResponse extends BaseResponse {
  BoolResponse({
    bool success = true,
    List<BaseResponseError> errors = const [],
    this.done = false,
  }) : super(success: success, errors: errors);

  factory BoolResponse.fromJson(Map<String, dynamic>? json) => _$BoolResponseFromJson(json ?? {});

  final bool done;
}
