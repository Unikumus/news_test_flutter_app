// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Project imports:
import 'package:test_news_flutter_app/core/services/service_locator.dart';
import 'package:test_news_flutter_app/core/services/settings.dart';
import 'package:test_news_flutter_app/presentation/pages/service_page.dart';
import 'package:test_news_flutter_app/presentation/pages/settings_page.dart';
import 'package:test_news_flutter_app/presentation/pages/status_page.dart';
import 'package:test_news_flutter_app/presentation/states/main_state.dart';
import 'package:test_news_flutter_app/theme/colors.dart';
import 'package:test_news_flutter_app/theme/icons_set_icons.dart';
import 'package:test_news_flutter_app/theme/sizes.dart';
import '../widgets/app_bottom_navigation_bar.dart';
import 'my_events_page.dart';
import 'notifications_page.dart';
import 'onboarding_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const routeName = '/profile';

  MainState get state => service<MainState>();

  Settings get settings => service<Settings>();

  ListTile _buildListTile({
    IconData? icon,
    IconData? trailingIcon,
    Color? customColor,
    required String title,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return ListTile(
      leading: icon == null
          ? null
          : Icon(
              icon,
              color: AppColors.mainColor,
            ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w700,
              color: customColor ?? AppColors.blackColor,
            ),
      ),
      trailing: Icon(
        trailingIcon ?? Icons.arrow_forward_ios,
        color: customColor ?? AppColors.gray2,
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          width: 1,
          color: AppColors.blackLight2,
        ),
        borderRadius: BorderRadius.circular(sidePadding8),
      ),
      tileColor: AppColors.blackLight2,
    );
  }

  Future<void> _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Выйти из аккаунта'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Вы уверены что хотите выйти из аккаунта?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Нет'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Да'),
              onPressed: () {
                settings.cleanStorages().then((value) {
                  Navigator.of(context).pushReplacementNamed(OnboardingPage.routeName);
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 320,
        leading: Container(
          margin: const EdgeInsets.only(left: sidePadding24),
          child: Text(
            AppLocalizations.of(context)!.myProfile,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor,
                ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: sidePadding24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state.user != null && settings.isUserAuth)
                ListTile(
                  minVerticalPadding: sidePadding12,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: sidePadding16,
                    vertical: sidePadding4,
                  ),
                  dense: false,
                  leading: SizedBox(
                    width: 72,
                    height: 72,
                    child: Image.asset(
                      state.user!.avatar,
                      width: 72,
                      height: 72,
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${state.user!.name} ${state.user!.secondName}',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.blackColor,
                            ),
                      ),
                      const SizedBox(height: sidePadding16),
                      Container(
                        height: 24,
                        width: 70,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.blackColor,
                          borderRadius: BorderRadius.circular(sidePadding24),
                        ),
                        child: Text(
                          '${state.user!.id}',
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      )
                    ],
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: AppColors.blackLight2),
                    borderRadius: BorderRadius.circular(sidePadding12),
                  ),
                  tileColor: AppColors.blackLight2,
                ),
              const SizedBox(height: sidePadding16),
              Text(
                AppLocalizations.of(context)!.main,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.gray2,
                    ),
              ),
              const SizedBox(height: sidePadding16),
              _buildListTile(
                title: AppLocalizations.of(context)!.notificationCenter,
                icon: IconsSet.bell,
                context: context,
                onTap: () {
                  Navigator.of(context).pushNamed(NotificationsPage.routeName);
                },
              ),
              const SizedBox(height: sidePadding8),
              _buildListTile(
                title: AppLocalizations.of(context)!.myEvents,
                icon: IconsSet.calendar,
                context: context,
                onTap: () {
                  Navigator.of(context).pushReplacement(CustomPageRoute(child: const MyEventsPage()));
                },
              ),
              const SizedBox(height: sidePadding8),
              _buildListTile(
                title: AppLocalizations.of(context)!.services,
                icon: IconsSet.handsuitcase,
                context: context,
                onTap: () {
                  Navigator.of(context).pushNamed(ServicePage.routeName);
                },
              ),
              const SizedBox(height: sidePadding8),
              _buildListTile(
                title: AppLocalizations.of(context)!.statusBadgeAndVehicle,
                icon: IconsSet.checkmark,
                context: context,
                onTap: () {
                  Navigator.of(context).pushNamed(StatusPage.routeName);
                },
              ),
              const SizedBox(height: sidePadding8),
              _buildListTile(
                title: AppLocalizations.of(context)!.accountSettings,
                icon: IconsSet.settings,
                context: context,
                onTap: () {
                  Navigator.of(context).pushNamed(SettingsPage.routeName);
                },
              ),
              const SizedBox(height: sidePadding24),
              _buildListTile(
                trailingIcon: IconsSet.signout,
                title: AppLocalizations.of(context)!.signOut,
                context: context,
                customColor: AppColors.redLight,
                onTap: () {
                  _showAlertDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(currentIndex: 3),
    );
  }
}
