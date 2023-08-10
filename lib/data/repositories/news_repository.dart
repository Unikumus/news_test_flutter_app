// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:test_news_flutter_app/core/services/api_client.dart';
import 'package:test_news_flutter_app/core/services/crashlytics.dart';
import 'package:test_news_flutter_app/core/services/service_locator.dart';
import 'package:test_news_flutter_app/data/models/events/events_response.dart';
import 'package:test_news_flutter_app/data/models/load_result.dart';
import 'package:test_news_flutter_app/data/models/news/news_response.dart';
import 'package:test_news_flutter_app/domain/models/events/event_model.dart';
import 'package:test_news_flutter_app/domain/models/news/news_model.dart';

class NewsRepository {
  ApiClient get apiClient => service<ApiClient>();

  Future<ListLoadResult<NewsModel>> loadNews() async {
    const defaultErrorMessage = 'Не удалось загрузить новости';

    try {
      final s = Stopwatch();
      s.start();
      debugPrint('Загружаем новости');

      final responseMap = await apiClient.get<Map<String, dynamic>>(MockDataType.mockNews);

      await Future.delayed(const Duration(seconds: 3));

      final response = NewsResponse.fromJson(responseMap);

      debugPrint('<<< Новости загружены за ${s.elapsedMilliseconds}мс');
      s.stop();

      if (response.success) {
        return ListLoadResult(
          data: response.news,
          totalCount: response.total,
          limit: response.limit,
          page: response.page,
        );
      }

      return const ListLoadResult(exception: defaultErrorMessage);
    } on DioException catch (e) {
      return ListLoadResult(
        exception: defaultErrorMessage,
        noConnect: e.error is SocketException,
      );
    } catch (e) {
      CrashlyticsService.captureException(e);
      return ListLoadResult(exception: '$defaultErrorMessage\n$e');
    }
  }

  Future<ListLoadResult<EventModel>> loadEvents() async {
    const defaultErrorMessage = 'Не удалось загрузить события';

    try {
      final s = Stopwatch();
      s.start();
      debugPrint('Загружаем события');

      final responseMap = await apiClient.get<Map<String, dynamic>>(MockDataType.mockEvents);

      await Future.delayed(const Duration(seconds: 1));

      final response = EventsResponse.fromJson(responseMap);

      debugPrint('<<< События загружены за ${s.elapsedMilliseconds}мс');
      s.stop();

      if (response.success) {
        return ListLoadResult(
          data: response.events,
          totalCount: response.total,
          limit: response.limit,
          page: response.page,
        );
      }

      return const ListLoadResult(exception: defaultErrorMessage);
    } on DioException catch (e) {
      return ListLoadResult(
        exception: defaultErrorMessage,
        noConnect: e.error is SocketException,
      );
    } catch (e) {
      CrashlyticsService.captureException(e);
      return ListLoadResult(exception: '$defaultErrorMessage\n$e');
    }
  }
}
