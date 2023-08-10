// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_mobx/flutter_mobx.dart';

// Project imports:
import 'package:test_news_flutter_app/core/services/service_locator.dart';
import 'package:test_news_flutter_app/core/services/settings.dart';
import 'package:test_news_flutter_app/presentation/states/main_state.dart';
import 'package:test_news_flutter_app/theme/colors.dart';
import 'package:test_news_flutter_app/theme/sizes.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  static const routeName = '/settings';

  Settings get settings => service<Settings>();

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
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Settings Page',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(sidePadding24),
            child: Observer(builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: sidePadding24),
                    child: Text('Язык'),
                  ),
                  RadioListTile(
                    title: const Text(
                      "RU",
                      style: TextStyle(fontSize: 16),
                      softWrap: true,
                    ),
                    groupValue: state.language,
                    value: 'RU',
                    activeColor: Colors.green,
                    onChanged: (val) async {
                      state.switchLanguage(val ?? 'RU');
                    },
                    toggleable: true,
                  ),
                  RadioListTile(
                    title: const Text(
                      "ENG",
                      style: TextStyle(fontSize: 16),
                      softWrap: true,
                    ),
                    groupValue: state.language,
                    value: "ENG",
                    activeColor: Colors.green,
                    onChanged: (val) async {
                      state.switchLanguage(val ?? 'ENG');
                    },
                    toggleable: true,
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Очистить настройки"),
                          content: const Text("Вы действительно хотите очистить настройки?"),
                          actions: [
                            TextButton(
                              child: const Text("OK"),
                              onPressed: () async {
                                settings.cleanStorages().then(
                                      (value) => ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Хранилище очищено'),
                                        ),
                                      ),
                                    );
                              },
                            )
                          ],
                        );
                      },
                    ),
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
                      'Clear Settings',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
