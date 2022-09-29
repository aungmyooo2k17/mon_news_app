import 'package:flutter/material.dart';
import 'package:mon_news_app/theme/color_theme.dart';
import 'package:mon_news_app/ui/screen/donate/ads_screen.dart';
import 'package:mon_news_app/ui/screen/donate/cards_screen.dart';
import 'package:mon_news_app/ui/screen/donate/crypto_screen.dart';
import 'package:mon_news_app/widget/app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DonatePage extends StatelessWidget {
  const DonatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: MyAppBar(
            title: AppLocalizations.of(context)!.donate,
          ),
          backgroundColor: Colors.white,
          bottom: TabBar(
            labelColor: AppColor.primaryColor,
            unselectedLabelColor: Colors.black87,
            indicatorColor: AppColor.primaryColor,
            tabs: [
              Tab(
                text: AppLocalizations.of(context)!.crypto,
              ),
              Tab(
                text: AppLocalizations.of(context)!.cards,
              ),
              Tab(
                text: AppLocalizations.of(context)!.ads,
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
