// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  Future<void> initStorage() async {
    _storage = await SharedPreferences.getInstance();
  }

  bool get isAccessTokenValid {
    return true;
  }

  late SharedPreferences _storage;

  /// Авторизационный токен
  String get accessToken => 'token';

  /// Url бекенда
  Uri? get backendUri => Uri.tryParse('url');

  static const locale = 'ru_RU';

  static const showOnBoardingKey = 'showOnBoarding';
  static const isAuthKey = 'isAuth';
  static const languageKey = 'language';

  static final defaultValues = {
    showOnBoardingKey: true,
    isAuthKey: false,
    languageKey: 'RU',
  };

  /// Показывать ли онбоардинг
  bool get showOnBoarding => _storage.getBool(showOnBoardingKey) ?? defaultValues[showOnBoardingKey] as bool;

  set showOnBoarding(bool? value) =>
      _storage.setBool(showOnBoardingKey, value ?? defaultValues[showOnBoardingKey] as bool);

  /// Зарегистрирован ли пользователь
  bool get isUserAuth => _storage.getBool(isAuthKey) ?? defaultValues[isAuthKey] as bool;

  set isUserAuth(bool? value) => _storage.setBool(isAuthKey, value ?? defaultValues[isAuthKey] as bool);

  /// Язык
  String get language => _storage.getString(languageKey) ?? defaultValues[languageKey] as String;

  set language(String? value) => _storage.setString(languageKey, value ?? defaultValues[languageKey] as String);

  Future<void> cleanStorages() async {
    _storage.clear();
  }
}
