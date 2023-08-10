// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainState on _MainState, Store {
  Computed<List<NewsModel>>? _$newsFilteredComputed;

  @override
  List<NewsModel> get newsFiltered => (_$newsFilteredComputed ??=
          Computed<List<NewsModel>>(() => super.newsFiltered,
              name: '_MainState.newsFiltered'))
      .value;
  Computed<List<EventModel>>? _$favoritesUserEventComputed;

  @override
  List<EventModel> get favoritesUserEvent => (_$favoritesUserEventComputed ??=
          Computed<List<EventModel>>(() => super.favoritesUserEvent,
              name: '_MainState.favoritesUserEvent'))
      .value;
  Computed<Set<String>>? _$newsCategoriesComputed;

  @override
  Set<String> get newsCategories => (_$newsCategoriesComputed ??=
          Computed<Set<String>>(() => super.newsCategories,
              name: '_MainState.newsCategories'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: '_MainState.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$userAtom = Atom(name: '_MainState.user', context: context);

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$languageAtom =
      Atom(name: '_MainState.language', context: context);

  @override
  String get language {
    _$languageAtom.reportRead();
    return super.language;
  }

  @override
  set language(String value) {
    _$languageAtom.reportWrite(value, super.language, () {
      super.language = value;
    });
  }

  late final _$activeTabAtom =
      Atom(name: '_MainState.activeTab', context: context);

  @override
  HomeTabs get activeTab {
    _$activeTabAtom.reportRead();
    return super.activeTab;
  }

  @override
  set activeTab(HomeTabs value) {
    _$activeTabAtom.reportWrite(value, super.activeTab, () {
      super.activeTab = value;
    });
  }

  late final _$errorAtom = Atom(name: '_MainState.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$activeEventAtom =
      Atom(name: '_MainState.activeEvent', context: context);

  @override
  int get activeEvent {
    _$activeEventAtom.reportRead();
    return super.activeEvent;
  }

  @override
  set activeEvent(int value) {
    _$activeEventAtom.reportWrite(value, super.activeEvent, () {
      super.activeEvent = value;
    });
  }

  late final _$badgeContentAtom =
      Atom(name: '_MainState.badgeContent', context: context);

  @override
  int get badgeContent {
    _$badgeContentAtom.reportRead();
    return super.badgeContent;
  }

  @override
  set badgeContent(int value) {
    _$badgeContentAtom.reportWrite(value, super.badgeContent, () {
      super.badgeContent = value;
    });
  }

  late final _$newsAtom = Atom(name: '_MainState.news', context: context);

  @override
  List<NewsModel> get news {
    _$newsAtom.reportRead();
    return super.news;
  }

  @override
  set news(List<NewsModel> value) {
    _$newsAtom.reportWrite(value, super.news, () {
      super.news = value;
    });
  }

  late final _$eventsAtom = Atom(name: '_MainState.events', context: context);

  @override
  List<EventModel> get events {
    _$eventsAtom.reportRead();
    return super.events;
  }

  @override
  set events(List<EventModel> value) {
    _$eventsAtom.reportWrite(value, super.events, () {
      super.events = value;
    });
  }

  late final _$selectedCategoryAtom =
      Atom(name: '_MainState.selectedCategory', context: context);

  @override
  String get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(String value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$setActiveCategoryAsyncAction =
      AsyncAction('_MainState.setActiveCategory', context: context);

  @override
  Future<void> setActiveCategory(String value) {
    return _$setActiveCategoryAsyncAction
        .run(() => super.setActiveCategory(value));
  }

  late final _$switchLanguageAsyncAction =
      AsyncAction('_MainState.switchLanguage', context: context);

  @override
  Future<void> switchLanguage(String value) {
    return _$switchLanguageAsyncAction.run(() => super.switchLanguage(value));
  }

  late final _$toggleActiveEventAsyncAction =
      AsyncAction('_MainState.toggleActiveEvent', context: context);

  @override
  Future<void> toggleActiveEvent(int index) {
    return _$toggleActiveEventAsyncAction
        .run(() => super.toggleActiveEvent(index));
  }

  late final _$toggleActiveTabAsyncAction =
      AsyncAction('_MainState.toggleActiveTab', context: context);

  @override
  Future<void> toggleActiveTab() {
    return _$toggleActiveTabAsyncAction.run(() => super.toggleActiveTab());
  }

  late final _$fetchNewsAsyncAction =
      AsyncAction('_MainState.fetchNews', context: context);

  @override
  Future<void> fetchNews() {
    return _$fetchNewsAsyncAction.run(() => super.fetchNews());
  }

  late final _$fetchEventsAsyncAction =
      AsyncAction('_MainState.fetchEvents', context: context);

  @override
  Future<void> fetchEvents() {
    return _$fetchEventsAsyncAction.run(() => super.fetchEvents());
  }

  late final _$fetchUserAsyncAction =
      AsyncAction('_MainState.fetchUser', context: context);

  @override
  Future<void> fetchUser() {
    return _$fetchUserAsyncAction.run(() => super.fetchUser());
  }

  late final _$_MainStateActionController =
      ActionController(name: '_MainState', context: context);

  @override
  void clearError() {
    final _$actionInfo =
        _$_MainStateActionController.startAction(name: '_MainState.clearError');
    try {
      return super.clearError();
    } finally {
      _$_MainStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
user: ${user},
language: ${language},
activeTab: ${activeTab},
error: ${error},
activeEvent: ${activeEvent},
badgeContent: ${badgeContent},
news: ${news},
events: ${events},
selectedCategory: ${selectedCategory},
newsFiltered: ${newsFiltered},
favoritesUserEvent: ${favoritesUserEvent},
newsCategories: ${newsCategories}
    ''';
  }
}
