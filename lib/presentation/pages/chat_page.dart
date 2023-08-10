// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:test_news_flutter_app/presentation/widgets/app_bottom_navigation_bar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  static const routeName = '/chat';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Chat Page'),
      ),
      bottomNavigationBar: AppBottomNavigationBar(currentIndex: 2),
    );
  }
}
