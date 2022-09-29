import 'package:flutter/material.dart';
import 'package:mon_news_app/constants/size_constant.dart';
import 'package:mon_news_app/theme/theme_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScanQRPage extends StatelessWidget {
  const ScanQRPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.scan_to_donate,
            style: ThemeText.blackSubtitle1,
          ),
          const SizedBox(
            height: Sizes.dimen_12,
          ),
          Image.network(
            "https://app.thanlwintimes.com/assets/bitcoin.png",
            width: 200,
            height: 200,
          ),
        ],
      ),
    );
  }
}
