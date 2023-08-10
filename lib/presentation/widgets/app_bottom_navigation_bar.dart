// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Project imports:
import 'package:test_news_flutter_app/presentation/pages/profile_page.dart';
import 'package:test_news_flutter_app/theme/colors.dart';
import 'package:test_news_flutter_app/theme/icons_set_icons.dart';
import '../pages/chat_page.dart';
import '../pages/events_page.dart';
import '../pages/main_page.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({required this.currentIndex, Key? key}) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedItemColor: AppColors.blackColor,
      unselectedItemColor: AppColors.blackLight,
      iconSize: 16,
      unselectedLabelStyle: TextStyle(color: AppColors.blackColor),
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.of(context).pushReplacement(CustomPageRoute(child: MainPage()));
          case 1:
            Navigator.of(context).pushReplacement(CustomPageRoute(child: EventsPage()));
          case 2:
            Navigator.of(context).pushReplacement(CustomPageRoute(child: ChatPage()));
          case 3:
            Navigator.of(context).pushReplacement(CustomPageRoute(child: ProfilePage()));
        }
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(IconsSet.home),
          label: AppLocalizations.of(context)!.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(IconsSet.calendarselected),
          label: AppLocalizations.of(context)!.events,
        ),
        BottomNavigationBarItem(
          icon: const Icon(IconsSet.comment),
          label: AppLocalizations.of(context)!.chat,
        ),
        BottomNavigationBarItem(
          icon: const Icon(IconsSet.profile),
          label: AppLocalizations.of(context)!.myProfile,
        ),
      ],
    );
  }
}

class CustomPageRoute extends PageRouteBuilder {
  CustomPageRoute({
    required this.child,
  }) : super(pageBuilder: (context, animation, secondaryAnimation) => child);

  final Widget child;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
