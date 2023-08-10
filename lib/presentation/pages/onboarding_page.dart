// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

// Project imports:
import 'package:test_news_flutter_app/core/services/service_locator.dart';
import 'package:test_news_flutter_app/core/services/settings.dart';
import 'package:test_news_flutter_app/theme/colors.dart';
import 'package:test_news_flutter_app/theme/sizes.dart';
import '../../theme/assets.dart';
import 'login_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  static const routeName = '/onboarding';

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndexPage = 0;
  late List<String> _titles;
  late List<String> _subTitles;

  final PageController _controller = PageController();
  Settings get settings => service<Settings>();

  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _titles = [
      AppLocalizations.of(context)!.onboardintTitle1,
      AppLocalizations.of(context)!.onboardintTitle2,
      AppLocalizations.of(context)!.onboardintTitle3,
    ];

    _subTitles = [
      AppLocalizations.of(context)!.onboardintText1,
      AppLocalizations.of(context)!.onboardintText2,
      AppLocalizations.of(context)!.onboardintText3,
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (int page) {
              setState(() {
                currentIndexPage = page;
              });
            },
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.onboarding1),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.onboarding2),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.onboarding3),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          IgnorePointer(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.0,
                    0.7,
                    1,
                  ],
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black,
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            bottom: 40,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(sidePadding24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _titles[currentIndexPage],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: sidePadding16),
                    Text(
                      _subTitles[currentIndexPage],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: sidePadding16),
                    ElevatedButton(
                      onPressed: () {
                        if (currentIndexPage == 2) {
                          settings.showOnBoarding = false;
                          Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
                        } else {
                          _controller.animateToPage(
                            currentIndexPage + 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainColor,
                        minimumSize: const Size.fromHeight(50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                      ),
                      child: Text(
                        currentIndexPage == 2
                            ? AppLocalizations.of(context)!.startWork
                            : AppLocalizations.of(context)!.next,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                    const SizedBox(height: sidePadding16),
                    DotsIndicator(
                      dotsCount: 3,
                      position: currentIndexPage,
                      decorator: DotsDecorator(
                        activeColor: AppColors.mainColor,
                        color: AppColors.whiteColor,
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: sidePadding24),
                child: ElevatedButton(
                  onPressed: () {
                    settings.showOnBoarding = false;
                    Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ), // BorderRadius
                    ),
                    backgroundColor: AppColors.whiteColor.withOpacity(0.5),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.skip,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
