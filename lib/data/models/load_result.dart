// Project imports:
import 'base_response.dart';

class _BaseLoadResult<T> {
  const _BaseLoadResult({
    this.exception,
    this.noConnect = false,
    this.errors = const [],
    this.transactionId,
  });

  final dynamic exception;
  final List<BaseResponseError> errors;

  final String? transactionId;

  final bool noConnect;

  String get errorMessage {
    if (exception is String) {
      return exception as String;
    } else if (exception is Error) {
      return (exception as Error).toString();
    } else if (exception is Exception) {
      return (exception as Exception).toString();
    } else {
      return exception.toString();
    }
  }

  bool get isFailure => exception != null;

  bool get isSuccess => !isFailure;
}

class LoadResult<T> extends _BaseLoadResult {
  const LoadResult({
    this.data,
    dynamic exception,
    bool noConnect = false,
    List<BaseResponseError> errors = const [],
    super.transactionId,
  }) : super(
          exception: exception,
          noConnect: noConnect,
          errors: errors,
        );

  final T? data;
}

class ListLoadResult<T> extends _BaseLoadResult {
  const ListLoadResult({
    this.data,
    dynamic exception,
    bool noConnect = false,
    this.totalCount = 0,
    this.page = 0,
    this.limit = 0,
    super.transactionId,
  }) : super(
          exception: exception,
          noConnect: noConnect,
        );

  final List<T>? data;

  final int totalCount;

  final int page;

  final int limit;

  bool get canLoadMore => (data?.length ?? 0) < totalCount;
}
