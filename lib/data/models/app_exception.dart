// Flutter imports:
import 'package:flutter/widgets.dart';

abstract class AppEvent {}

class SecureAppEvent implements AppEvent {}

class AppException implements AppEvent, Exception {
  AppException([this.message, this.details, this.stackTrace, this.showNotification = true]);

  final dynamic message;
  final dynamic details;
  final StackTrace? stackTrace;
  final bool showNotification;

  @override
  String toString() {
    return message?.toString() ?? 'Ошибка в работе приложения';
  }
}

class LogStatAppException extends AppException {
  LogStatAppException({dynamic message, dynamic details, this.callback}) : super(message, details);

  final void Function(BuildContext)? callback;
}

class UnauthorizedException implements AppEvent, Exception {
  final message = 'Ошибка авторизации\n';

  @override
  String toString() => message;
}

abstract class WithCallbackException implements AppEvent, Exception {
  WithCallbackException({
    this.callback,
    this.message = 'Произошла ошибка',
    this.details = '',
    this.buttonTitle = 'Обновить',
  });

  final Future Function()? callback;
  final String message;
  final String details;
  final String buttonTitle;

  @override
  String toString() => message;
}

/// Исключение типа "нет подключения с интернетом"
class NoInternetConnectionException extends WithCallbackException {
  NoInternetConnectionException({this.isFromPlatform = false, Future Function()? callback})
      : super(
          callback: callback,
          message: 'Нет соединения с интернетом',
          details: 'Проверьте подключение к сети и нажмите «Обновить»',
          buttonTitle: 'Обновить',
        );

  final bool isFromPlatform;
}

class TokenInvalidException implements Exception {
  final String message = 'Авторизационный токен устарел';

  @override
  String toString() => message;
}
