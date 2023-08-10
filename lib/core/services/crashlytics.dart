// Flutter imports:
import 'package:flutter/material.dart';

class CrashlyticsService {
  static captureException(Object e) {
    debugPrint("ERROR: $e");
  }
}
