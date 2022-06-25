import 'package:flutter/material.dart';
import 'package:mon_news_app/ui/screen/bookmark_screen.dart';

import '../../../constants/size_constant.dart';
import '../../../theme/color_theme.dart';
import '../../../theme/theme_text.dart';

class MediaSetting extends StatefulWidget {
  const MediaSetting({Key? key}) : super(key: key);

  @override
  State<MediaSetting> createState() => _MediaSettingState();
}

class _MediaSettingState extends State<MediaSetting> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Media",
          style: ThemeText.blackSubtitle1,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Language',
              style: ThemeText.blackBodyText2,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColor.primaryColor,
              size: Sizes.dimen_20,
            ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Divider(),
        const SizedBox(
          height: 8.0,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BookMarkPage()),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Bookmarks',
                style: ThemeText.blackBodyText2,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColor.primaryColor,
                size: Sizes.dimen_20,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Divider(),
        const SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Share our app',
              style: ThemeText.blackBodyText2,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColor.primaryColor,
              size: Sizes.dimen_20,
            ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Divider(),
        const SizedBox(
          height: 8.0,
        ),
      ],
    );
  }

  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }
}
