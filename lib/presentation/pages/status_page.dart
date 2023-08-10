// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:test_news_flutter_app/theme/colors.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key? key}) : super(key: key);

  static const routeName = '/status';

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
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Status Page',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      body: const Center(
        child: Text('Status Page'),
      ),
    );
  }
}
