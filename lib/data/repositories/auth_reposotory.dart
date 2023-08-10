// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:test_news_flutter_app/core/services/api_client.dart';
import 'package:test_news_flutter_app/core/services/crashlytics.dart';
import 'package:test_news_flutter_app/core/services/service_locator.dart';
import 'package:test_news_flutter_app/data/models/load_result.dart';
import 'package:test_news_flutter_app/data/models/user/user_response.dart';
import 'package:test_news_flutter_app/domain/models/user/user_model.dart';

class AuthRepository {
  ApiClient get apiClient => service<ApiClient>();

  Future<LoadResult<bool>> relogin({dynamic from}) async {
    return const LoadResult(data: true);
  }

  Future<LoadResult<UserModel>> loadUser() async {
    const defaultErrorMessage = 'Не удалось загрузить юзера';

    try {
      final s = Stopwatch();
      s.start();
      debugPrint('Загружаем юзера');

      final responseMap = await apiClient.get<Map<String, dynamic>>(MockDataType.mockUser);

      await Future.delayed(const Duration(seconds: 2));

      final response = UserResponse.fromJson(responseMap);

      debugPrint('<<< Данные юзера загружены за ${s.elapsedMilliseconds}мс');
      s.stop();

      if (response.success) {
        return LoadResult(
          data: response.data,
        );
      }

      return const LoadResult(exception: defaultErrorMessage);
    } on DioException catch (e) {
      return LoadResult(
        exception: defaultErrorMessage,
        noConnect: e.error is SocketException,
      );
    } catch (e) {
      CrashlyticsService.captureException(e);

      return LoadResult(exception: '$defaultErrorMessage\n$e');
    }
  }
}
