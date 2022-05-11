import 'package:flutter/material.dart';
import 'package:mon_news_app/constants/string_constant.dart';

import '../constants/size_constant.dart';
import '../theme/theme_text.dart';

class AppTextField extends StatelessWidget {
  String label;
  String hint;

  AppTextField({Key? key, required this.label, required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        label,
        style: ThemeText.textFieldLabel,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: SizedBox(
          height: Sizes.dimen_40,
          child: TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hint,
            ),
          ),
        ),
      )
    ]);
  }
}
