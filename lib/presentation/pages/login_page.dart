// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

// Project imports:
import 'package:test_news_flutter_app/core/services/service_locator.dart';
import 'package:test_news_flutter_app/core/services/settings.dart';
import 'package:test_news_flutter_app/presentation/states/main_state.dart';
import 'package:test_news_flutter_app/theme/assets.dart';
import 'package:test_news_flutter_app/theme/colors.dart';
import 'package:test_news_flutter_app/theme/sizes.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  MainState get state => service<MainState>();

  Settings get settings => service<Settings>();

  @override
  void initState() {
    FlutterNativeSplash.remove();
    state.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(sidePadding24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Image.asset(Assets.logo),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    settings.isUserAuth = true;
                    Navigator.of(context).pushReplacementNamed(MainPage.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor,
                    minimumSize: const Size.fromHeight(50),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(sidePadding12),
                      ),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.loginWithELK,
                    style: const TextStyle(color: AppColors.whiteColor),
                  ),
                ),
                const SizedBox(height: sidePadding16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(MainPage.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColorLight,
                    minimumSize: const Size.fromHeight(50),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(sidePadding12),
                      ),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.loginWithoutAuthorization,
                    style: const TextStyle(color: AppColors.mainColor),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
