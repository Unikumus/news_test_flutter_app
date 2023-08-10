// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Project imports:
import 'package:test_news_flutter_app/core/services/service_locator.dart';
import 'package:test_news_flutter_app/presentation/pages/profile_page.dart';
import 'package:test_news_flutter_app/presentation/states/main_state.dart';
import 'package:test_news_flutter_app/presentation/widgets/app_bottom_navigation_bar.dart';
import 'package:test_news_flutter_app/theme/assets.dart';
import 'package:test_news_flutter_app/theme/colors.dart';
import 'package:test_news_flutter_app/theme/icons_set_icons.dart';
import 'package:test_news_flutter_app/theme/sizes.dart';

class MyEventsPage extends StatelessWidget {
  const MyEventsPage({Key? key}) : super(key: key);
  static const routeName = '/myEvents ';

  MainState get state => service<MainState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.blackColor,
            ),
            onPressed: () => Navigator.of(context).pushReplacement(
              CustomPageRoute(
                child: const ProfilePage(),
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.myEvents,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w700,
              ),
        ),
        actions: const [
          Icon(
            IconsSet.clock,
            color: AppColors.blackColor,
          ),
          SizedBox(width: sidePadding24),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(sidePadding24),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(height: sidePadding16),
        itemBuilder: (BuildContext context, int index) => Container(
          // height: 130,
          padding: const EdgeInsets.all(sidePadding16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(sidePadding24),
            color: AppColors.blackLight2,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.favoritesUserEvent[index].title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.blackColor,
                          ),
                    ),
                    const SizedBox(height: sidePadding16),
                    Text(
                      '${AppLocalizations.of(context)!.role} ${state.user!.favoritesEvent.firstWhere((element) => element.id - 1 == index).role}',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.gray2,
                          ),
                    ),
                    const SizedBox(height: sidePadding16),
                    Text(
                      state.favoritesUserEvent[index].period,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.gray2,
                          ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                Assets.eventIcon,
                width: 48,
                height: 48,
              ),
            ],
          ),
        ),
        itemCount: state.favoritesUserEvent.length,
      ),
      bottomNavigationBar: const AppBottomNavigationBar(currentIndex: 3),
    );
  }
}
