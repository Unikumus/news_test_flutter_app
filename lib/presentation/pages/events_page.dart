// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:test_news_flutter_app/presentation/widgets/app_bottom_navigation_bar.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  static const routeName = '/events';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Events Page'),
      ),
      bottomNavigationBar: AppBottomNavigationBar(currentIndex: 1),
    );
  }
}
