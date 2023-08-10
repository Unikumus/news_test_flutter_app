// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:test_news_flutter_app/core/services/service_locator.dart';
import 'package:test_news_flutter_app/core/services/settings.dart';
import 'package:test_news_flutter_app/data/mocks/mock_events.dart';
import 'package:test_news_flutter_app/data/mocks/mock_news.dart';
import 'package:test_news_flutter_app/data/mocks/mock_user.dart';
import 'package:test_news_flutter_app/data/models/app_exception.dart';
import 'package:test_news_flutter_app/data/repositories/auth_reposotory.dart';

enum MockDataType {
  mockNews,
  mockEvents,
  mockUser,
}

class ApiClient {
  ApiClient(this.appInfoHeaders) {
    final dioInterceptor = InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        return handler.next(response);
      },
      onError: (DioError error, ErrorInterceptorHandler handler) {
        return handler.next(error);
      },
    );
    _dio = Dio();

    _dio.interceptors.clear();
    _dio.interceptors.add(dioInterceptor);
  }

  final Map<String, String> appInfoHeaders;

  Settings get _settings => service<Settings>();

  String get backendUrl => _settings.backendUri?.toString() ?? '';

  late Dio _dio;

  Future<Response> download(
    String urlPath,
    savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    data,
    Options? options,
  }) async {
    if (!service<Settings>().isAccessTokenValid) {
      await service<AuthRepository>().relogin(from: 'DOWNLOAD: $urlPath');
      if (!service<Settings>().isAccessTokenValid) {
        throw TokenInvalidException();
      }
    }

    return _dio.download(
      urlPath,
      savePath,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      deleteOnError: deleteOnError,
      lengthHeader: lengthHeader,
      data: data,
      options: options,
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    if (!service<Settings>().isAccessTokenValid) {
      await service<AuthRepository>().relogin(from: 'POST: $path');
      if (!service<Settings>().isAccessTokenValid) {
        throw TokenInvalidException();
      }
    }
    return _dio.post<T>(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }

  /// Mock GET request
  Future<Map<String, dynamic>> get<T>(MockDataType mockDataType) async {
    await Future.delayed(const Duration(seconds: 1));

    switch (mockDataType) {
      case MockDataType.mockEvents:
        return mockEvents;
      case MockDataType.mockNews:
        return mockNews;
      case MockDataType.mockUser:
        return mockUser;
    }
  }

  Future<Response<T>> put<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    if (!service<Settings>().isAccessTokenValid) {
      await service<AuthRepository>().relogin(from: 'PUT: $path');
      if (!service<Settings>().isAccessTokenValid) {
        throw TokenInvalidException();
      }
    }
    return _dio.put<T>(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }

  Future<Response<T>> patch<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    if (!service<Settings>().isAccessTokenValid) {
      await service<AuthRepository>().relogin(from: 'PATCH: $path');
      if (!service<Settings>().isAccessTokenValid) {
        throw TokenInvalidException();
      }
    }
    return _dio.patch<T>(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }

  Future<Response<T>> delete<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    if (!service<Settings>().isAccessTokenValid) {
      await service<AuthRepository>().relogin(from: 'DELETE: $path');
      if (!service<Settings>().isAccessTokenValid) {
        throw TokenInvalidException();
      }
    }
    return _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }
}
