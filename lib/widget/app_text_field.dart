import 'package:flutter/material.dart';
import 'package:mon_news_app/constants/string_constant.dart';
import 'package:mon_news_app/theme/color_theme.dart';

import '../constants/size_constant.dart';
import '../theme/theme_text.dart';

class AppTextField extends StatelessWidget {
  String? label;
  String hint;
  TextEditingController controller;

  AppTextField(
      {Key? key, this.label, required this.hint, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      label != null
          ? Text(
              label ?? "",
              style: ThemeText.textFieldLabel,
            )
          : Container(),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TextField(
          controller: controller,
          style: const TextStyle(height: 0, color: Colors.black87),
          decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primaryColor, width: 1),
              ),
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 0, color: Colors.grey.shade300),
              )),
        ),
      )
    ]);
  }
}
