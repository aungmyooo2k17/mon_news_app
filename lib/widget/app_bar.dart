import 'package:flutter/material.dart';
import 'package:mon_news_app/theme/color_theme.dart';
import 'package:mon_news_app/theme/theme_text.dart';
import 'package:mon_news_app/ui/screen/bookmark_screen.dart';
import '../constants/size_constant.dart';
import 'logo.dart';

class MyAppBar extends StatelessWidget {
  final String? title;

  const MyAppBar({
    Key? key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Sizes.dimen_8, bottom: Sizes.dimen_8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          title == null
              ? const Logo(
                  height: Sizes.dimen_32,
                )
              : Text(
                  title!,
                  style: ThemeText.appbarTitle,
                ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BookMarkPage()),
              );
            },
            icon: const Icon(
              Icons.bookmark,
              color: AppColor.secondaryColor,
              size: Sizes.dimen_20,
            ),
          ),
        ],
      ),
    );
  }
}
