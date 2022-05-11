import 'package:flutter/material.dart';
import 'package:mon_news_app/constants/size_constant.dart';
import 'package:mon_news_app/theme/theme_text.dart';

class ScanQRPage extends StatelessWidget {
  const ScanQRPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Scan QR to donate",
            style: ThemeText.blackSubtitle1,
          ),
          const SizedBox(
            height: Sizes.dimen_12,
          ),
          Image.asset("assets/images/qr_code.png"),
        ],
      ),
    );
  }
}
