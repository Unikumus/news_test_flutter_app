// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:test_news_flutter_app/presentation/pages/about_fund_page.dart';
import 'package:test_news_flutter_app/presentation/pages/chat_page.dart';
import 'package:test_news_flutter_app/presentation/pages/events_page.dart';
import 'package:test_news_flutter_app/presentation/pages/login_page.dart';
import 'package:test_news_flutter_app/presentation/pages/main_page.dart';
import 'package:test_news_flutter_app/presentation/pages/my_events_page.dart';
import 'package:test_news_flutter_app/presentation/pages/notifications_page.dart';
import 'package:test_news_flutter_app/presentation/pages/onboarding_page.dart';
import 'package:test_news_flutter_app/presentation/pages/profile_page.dart';
import 'package:test_news_flutter_app/presentation/pages/service_page.dart';
import 'package:test_news_flutter_app/presentation/pages/settings_page.dart';
import 'package:test_news_flutter_app/presentation/pages/status_page.dart';

class Routes {
  String test = 'test';

  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments;
    Route? route;

    switch (routeSettings.name) {
      case LoginPage.routeName:
        route = MaterialPageRoute(builder: (context) => LoginPage());
        break;

      case OnboardingPage.routeName:
        route = MaterialPageRoute(builder: (context) => const OnboardingPage());
        break;

      case MainPage.routeName:
        route = MaterialPageRoute(builder: (context) => MainPage());
        break;
      case EventsPage.routeName:
        route = MaterialPageRoute(builder: (context) => const EventsPage());
        break;
      case ChatPage.routeName:
        route = MaterialPageRoute(builder: (context) => const ChatPage());
        break;
      case ProfilePage.routeName:
        route = MaterialPageRoute(builder: (context) => const ProfilePage());
        break;
      case MyEventsPage.routeName:
        route = MaterialPageRoute(builder: (context) => const MyEventsPage());
        break;
      case NotificationsPage.routeName:
        route = MaterialPageRoute(builder: (context) => const NotificationsPage());
        break;
      case ServicePage.routeName:
        route = MaterialPageRoute(builder: (context) => const ServicePage());
        break;

      case StatusPage.routeName:
        route = MaterialPageRoute(builder: (context) => const StatusPage());
        break;

      case SettingsPage.routeName:
        route = MaterialPageRoute(builder: (context) => SettingsPage());
        break;

      case AboutFundPage.routeName:
        route = MaterialPageRoute(builder: (context) => const AboutFundPage());
        break;

      default:
        route = MaterialPageRoute(builder: (context) => const ProfilePage());
    }

    return route;
  }
}
