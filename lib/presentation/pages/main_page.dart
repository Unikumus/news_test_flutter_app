// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:badges/badges.dart' as badges;
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

// Project imports:
import 'package:test_news_flutter_app/core/services/service_locator.dart';
import 'package:test_news_flutter_app/core/utils/extentions.dart';
import 'package:test_news_flutter_app/domain/models/news/news_model.dart';
import 'package:test_news_flutter_app/presentation/pages/about_fund_page.dart';
import 'package:test_news_flutter_app/presentation/states/main_state.dart';
import 'package:test_news_flutter_app/presentation/widgets/app_bottom_navigation_bar.dart';
import 'package:test_news_flutter_app/theme/assets.dart';
import 'package:test_news_flutter_app/theme/colors.dart';
import 'package:test_news_flutter_app/theme/icons_set_icons.dart';
import 'package:test_news_flutter_app/theme/sizes.dart';
import 'notifications_page.dart';

// import 'package:cached_network_image/cached_network_image.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pageViewController = PageController(initialPage: 0, viewportFraction: 0.9);

  MainState get state => service<MainState>();

  @override
  void initState() {
    FlutterNativeSplash.remove();
    state.initialize();
    super.initState();
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: sidePadding24),
        child: Image.asset(Assets.logo),
      ),
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      actions: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AboutFundPage.routeName);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(30, 40),
              elevation: 0,
              backgroundColor: AppColors.blackLight2,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ), // BorderRadius
              ),
            ),
            child: Text(
              AppLocalizations.of(context)!.aboutTheFund,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        ),
        const SizedBox(width: sidePadding8),
        badges.Badge(
          badgeStyle: const badges.BadgeStyle(
            badgeColor: AppColors.mainColor,
          ),
          position: badges.BadgePosition.topEnd(top: -2, end: 4),
          badgeContent: Text(
            '${state.badgeContent}',
            style: const TextStyle(color: AppColors.whiteColor),
          ),
          child: IconButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blackLight2,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
            ),
            color: AppColors.blackColor,
            onPressed: () {
              Navigator.of(context).pushNamed(NotificationsPage.routeName);
            },
            icon: const Icon(IconsSet.bell),
          ),
        ),
        const SizedBox(width: sidePadding24),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Observer(builder: (context) {
      final controller = ValueNotifier<HomeTabs>(state.activeTab)
        ..addListener(() {
          state.toggleActiveTab();
        });

      return state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                const SizedBox(height: sidePadding16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: sidePadding24),
                  child: SizedBox.fromSize(
                    size: const Size.fromHeight(36),
                    child: AdvancedSegment(
                      controller: controller,
                      segments: {
                        HomeTabs.events: AppLocalizations.of(context)!.events,
                        HomeTabs.news: AppLocalizations.of(context)!.news,
                      },
                      activeStyle: const TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                      inactiveStyle: const TextStyle(
                        color: AppColors.blackColor,
                      ),
                      backgroundColor: AppColors.grayLight,
                      sliderColor: Colors.white,
                      sliderOffset: 2.0, // Double
                      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                      itemPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      animationDuration: const Duration(milliseconds: 250),
                    ),
                  ),
                ),
                const SizedBox(height: sidePadding16),
                if (state.activeTab == HomeTabs.events) _buildEvents() else _buildNews(context),
                if (state.activeTab == HomeTabs.events) ...[
                  const SizedBox(height: sidePadding16),
                  DotsIndicator(
                    dotsCount: 3,
                    position: state.activeEvent,
                    decorator: DotsDecorator(
                      activeColor: AppColors.mainColor,
                      color: AppColors.whiteColor,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ]
              ],
            );
    });
  }

  List<Widget> _buildCategoriesButtons(BuildContext context) {
    List<Widget> result = [];
    for (final category in state.newsCategories) {
      final isSelected = state.selectedCategory == category;

      result.add(ElevatedButton(
        onPressed: () => state.setActiveCategory(category),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isSelected ? AppColors.mainColor : AppColors.blackLight2,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: isSelected ? AppColors.whiteColor : AppColors.blackColor,
          ),
        ),
      ));
    }

    return result;
  }

  Widget _buildNews(BuildContext context) {
    return Observer(builder: (context) {
      return Expanded(
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: sidePadding24),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) => const SizedBox(width: sidePadding24),
                itemBuilder: (BuildContext context, int index) => _buildCategoriesButtons(context)[index],
                itemCount: 3,
              ),
            ),
            _buildNewsList(state, context),
          ],
        ),
      );
    });
  }

  Widget _buildNewsList(MainState state, BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.all(sidePadding24),
        scrollDirection: Axis.vertical,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(height: sidePadding8),
        itemCount: state.newsFiltered.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(state.newsFiltered[index], context);
        },
      ),
    );
  }

  Widget _buildItem(NewsModel news, BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        isScrollControlled: true,
        builder: (context) => _newsDetail(context, news),
      ),
      child: Container(
        height: 130,
        padding: const EdgeInsets.all(sidePadding16),
        decoration: BoxDecoration(
          color: AppColors.grayLight,
          borderRadius: BorderRadius.circular(sidePadding24),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    '${news.timeStamp.ruDayMonthNameYear} - ${news.readTime} минут',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.gray2,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: sidePadding24),
            ClipRRect(
              borderRadius: BorderRadius.circular(sidePadding12),
              // child: CachedNetworkImage(
              //   height: 96,
              //   width: 96,
              //   imageUrl: news.thumbnailUrl,
              //   progressIndicatorBuilder: (context, url, downloadProgress) =>
              //       CircularProgressIndicator(value: downloadProgress.progress),
              //   errorWidget: (context, url, error) => const Icon(Icons.error),
              //   fit: BoxFit.cover,
              // ),
              child: Image.asset(
                news.thumbnailUrl,
                height: 96,
                width: 96,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _newsDetail(BuildContext context, NewsModel news) {
    return FractionallySizedBox(
      heightFactor: 0.8,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(sidePadding24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.oneNews,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const Spacer(),
                      IconButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blackLight2,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                        ),
                        color: AppColors.mainColor,
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: sidePadding24),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(sidePadding12),
                    child: Image.asset(
                      news.thumbnailUrl,
                      height: 160,
                      width: double.maxFinite,
                      fit: BoxFit.fitWidth,
                    ),
                    // Image.network(
                    //   news.thumbnailUrl,
                    //   height: 160,
                    //   width: double.maxFinite,
                    //   fit: BoxFit.fitWidth,
                    // ),
                  ),
                  const SizedBox(height: sidePadding24),
                  Text(
                    '${news.timeStamp.ruDayMonthNameYear} - ${news.readTime} минут',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.gray2,
                        ),
                  ),
                  const SizedBox(height: sidePadding24),
                  Text(news.content),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _share(
    BuildContext context,
  ) {
    return const FractionallySizedBox(
      heightFactor: 0.3,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
        child: SizedBox.expand(
          child: Padding(
            padding: EdgeInsets.all(sidePadding24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Поделиться новостью'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEvents() {
    return Observer(builder: (context) {
      return Expanded(
        child: PageView.builder(
          controller: _pageViewController,
          itemCount: state.events.length,
          onPageChanged: (int index) {
            state.toggleActiveEvent(index);
          },
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: sidePadding8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(sidePadding24),
                image: DecorationImage(
                  // colorFilter: ColorFilter.mode(AppColors.blackColor.withOpacity(0.4), BlendMode.darken),
                  // image: NetworkImage(
                  //   state.events[index].imageUrl,
                  // ),
                  image: AssetImage(
                    state.events[index].imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(sidePadding24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ), // BorderRadius
                        ),
                      ),
                      color: AppColors.whiteColor,
                      onPressed: () => showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                        ),
                        isScrollControlled: true,
                        builder: (context) => _share(context),
                      ),
                      icon: const Icon(
                        IconsSet.vector,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${state.events[index].period} | ${state.events[index].place}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.whiteColor,
                          ),
                    ),
                    const SizedBox(height: sidePadding8),
                    Text(
                      state.events[index].title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.whiteColor,
                          ),
                    ),
                    const SizedBox(height: sidePadding8),
                    Text(
                      state.events[index].location,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.whiteColor,
                          ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildContent(context),
      bottomNavigationBar: const AppBottomNavigationBar(currentIndex: 0),
    );
  }
}
