// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:test_news_flutter_app/core/services/settings.dart';

extension ExtDateTime on DateTime {
  /// Возвращает дату в формате "10 декабря 2021". Отличается от [ruGeneralDate] на "г."
  String get ruDayMonthNameYear => DateFormat('d MMMM y', Settings.locale).format(this);
}
