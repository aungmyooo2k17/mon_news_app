import 'package:flutter/material.dart';
import 'package:mon_news_app/theme/theme_text.dart';

class VersionSetting extends StatelessWidget {
  const VersionSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Version",
          style: ThemeText.versionText,
        ),
        Text(
          "1.0.0",
          style: ThemeText.versionText,
        ),
      ],
    );
  }
}
