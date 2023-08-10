// Package imports:
import 'package:event_bus/event_bus.dart';
import 'package:mobx/mobx.dart';

// Project imports:
import 'package:test_news_flutter_app/core/services/service_locator.dart';
import 'package:test_news_flutter_app/core/services/settings.dart';
import 'package:test_news_flutter_app/data/repositories/auth_reposotory.dart';
import 'package:test_news_flutter_app/data/repositories/news_repository.dart';
import 'package:test_news_flutter_app/domain/models/events/event_model.dart';
import 'package:test_news_flutter_app/domain/models/news/news_model.dart';
import 'package:test_news_flutter_app/domain/models/user/user_model.dart';
import '../../core/interfaces/disposable.dart';
import '../../core/interfaces/initializable.dart';
import '../../data/models/app_exception.dart';

part 'main_state.g.dart';

enum HomeTabs {
  events,
  news,
}

extension ClaimStatusExt on HomeTabs {
  String get title {
    switch (this) {
      case HomeTabs.events:
        return 'events';
      case HomeTabs.news:
        return 'news';
      default:
        return 'news';
    }
  }

  String get tabTitle {
    switch (this) {
      case HomeTabs.events:
        return 'Мероприятие';
      case HomeTabs.news:
        return 'Новости';
      default:
        return 'news';
    }
  }
}

class MainState = _MainState with _$MainState;

abstract class _MainState with Store implements Initializable, Disposable {
  _MainState(this.language);

  NewsRepository get repository => service<NewsRepository>();
  AuthRepository get authRepository => service<AuthRepository>();
  Settings get settings => service<Settings>();

  EventBus get eventBus => service<EventBus>();

  @observable
  bool isLoading = false;

  @observable
  UserModel? user;

  @observable
  String language;

  @observable
  HomeTabs activeTab = HomeTabs.events;

  @observable
  String? error;

  @observable
  int activeEvent = 0;

  @observable
  int badgeContent = 2;

  @observable
  List<NewsModel> news = [];

  @observable
  List<EventModel> events = [];

  @observable
  String selectedCategory = 'Все';

  @action
  void clearError() => error = null;

  @computed
  List<NewsModel> get newsFiltered =>
      selectedCategory == 'Все' ? news : news.where((element) => element.category == selectedCategory).toList();

  @computed
  List<EventModel> get favoritesUserEvent {
    final result = <EventModel>[];
    for (final event in user!.favoritesEvent) {
      result.add(events.firstWhere((element) => element.id == event.id));
    }
    return result;
  }

  @computed
  Set<String> get newsCategories => {'Все'}..addAll(news.map((element) => element.category).toSet());

  @action
  Future<void> setActiveCategory(String value) async {
    selectedCategory = value;
  }

  @action
  Future<void> switchLanguage(String value) async {
    language = value;
    settings.language = value;
  }

  @action
  Future<void> toggleActiveEvent(int index) async {
    activeEvent = index;
  }

  @action
  Future<void> toggleActiveTab() async {
    if (activeTab == HomeTabs.events) {
      activeTab = HomeTabs.news;
    } else {
      activeTab = HomeTabs.events;
    }
  }

  @action
  Future<void> fetchNews() async {
    final response = await repository.loadNews();

    if (response.isSuccess) {
      news = response.data ?? [];
    } else {
      if (response.noConnect) {
        eventBus.fire(NoInternetConnectionException(callback: fetchNews));
      } else {
        error = response.errorMessage;
      }
    }
  }

  @action
  Future<void> fetchEvents() async {
    final response = await repository.loadEvents();

    if (response.isSuccess) {
      events = response.data ?? [];
    } else {
      if (response.noConnect) {
        eventBus.fire(NoInternetConnectionException(callback: fetchEvents));
      } else {
        error = response.errorMessage;
      }
    }
  }

  @action
  Future<void> fetchUser() async {
    final response = await authRepository.loadUser();

    if (response.isSuccess) {
      user = response.data;
    } else {
      if (response.noConnect) {
        eventBus.fire(NoInternetConnectionException(callback: fetchUser));
      } else {
        error = response.errorMessage;
      }
    }
  }

  @override
  Future<void> initialize() async {
    isLoading = true;
    await Future.wait([
      fetchNews(),
      fetchEvents(),
      fetchUser(),
    ]);
    isLoading = false;
  }

  @override
  Future<void> dispose() async {}
}
