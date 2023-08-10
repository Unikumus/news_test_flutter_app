// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:event_bus/event_bus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

// Project imports:
import 'package:test_news_flutter_app/presentation/states/main_state.dart';
import 'package:test_news_flutter_app/theme/colors.dart';
import 'core/l10n/l10n.dart';
import 'core/navigation/routes.dart';
import 'core/services/api_client.dart';
import 'core/services/service_locator.dart';
import 'core/services/settings.dart';
import 'data/repositories/auth_reposotory.dart';
import 'data/repositories/news_repository.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Settings settings = Settings();
  if (service.isRegistered<Settings>()) {
    settings = service<Settings>();
  } else {
    await settings.initStorage();
    service.registerSingleton<Settings>(settings);
  }

  service.registerLazySingleton<EventBus>(() => EventBus());
  service.registerLazySingleton<ApiClient>(() => ApiClient({}));
  service.registerLazySingleton<NewsRepository>(() => NewsRepository());
  service.registerLazySingleton<AuthRepository>(() => AuthRepository());
  service.registerLazySingleton<MainState>(() => MainState(settings.language));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Settings get settings => service<Settings>();
  MainState get state => service<MainState>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        title: 'News',
        locale: state.language == 'RU' ? const Locale('ru') : const Locale('en'),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: L10n.all,
        theme: ThemeData(
          primaryColor: AppColors.mainColor,
          fontFamily: 'Sansation',
          scaffoldBackgroundColor: AppColors.whiteColor,
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
            elevation: 0,
          ),
          useMaterial3: false,
        ),
        initialRoute: settings.showOnBoarding
            ? '/onboarding'
            : settings.isUserAuth
                ? '/home'
                : '/login',
        onGenerateRoute: Routes.onGenerateRoute,
      );
    });
  }
}
