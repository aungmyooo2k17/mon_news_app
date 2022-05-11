import 'package:flutter/material.dart';
import 'package:mon_news_app/theme/color_theme.dart';
import 'package:mon_news_app/ui/screen/donate/ads_screen.dart';
import 'package:mon_news_app/ui/screen/donate/cards_screen.dart';
import 'package:mon_news_app/ui/screen/donate/crypto_screen.dart';
import 'package:mon_news_app/ui/screen/news_list_screen.dart';
import 'package:mon_news_app/ui/screen/story_post_screen.dart';
import 'package:mon_news_app/widget/app_bar.dart';

class DonatePage extends StatelessWidget {
  const DonatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: MyAppBar(
            title: "Donate",
          ),
          backgroundColor: Colors.white,
          bottom: const TabBar(
            labelColor: AppColor.primaryColor,
            unselectedLabelColor: Colors.black87,
            indicatorColor: AppColor.primaryColor,
            tabs: [
              Tab(
                text: 'Crypto',
              ),
              Tab(
                text: 'Cards',
              ),
              Tab(
                text: 'Ads',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const ScanQRPage(),
            const CardsPage(),
            AdsPage(),
          ],
        ),
      ),
    );
  }
}
