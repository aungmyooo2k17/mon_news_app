import 'package:flutter/material.dart';
import 'package:mon_news_app/constants/size_constant.dart';
import 'package:mon_news_app/theme/theme_text.dart';
import 'package:mon_news_app/ui/screen/home_screen.dart';
import 'package:mon_news_app/widget/app_btn_outline.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/no_internet.png',
            height: 200,
            width: 200,
          ),
          Text(
            "No Internet Connection",
            style: ThemeText.blackBodyText2,
          ),
          const SizedBox(
            height: Sizes.dimen_16,
          ),
          AppBtnOutline(
            label: "Refresh",
            color: Colors.grey,
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
