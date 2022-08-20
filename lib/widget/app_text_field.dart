import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mon_news_app/constants/string_constant.dart';
import 'package:mon_news_app/theme/color_theme.dart';

import '../constants/size_constant.dart';
import '../theme/theme_text.dart';

class AppTextField extends StatelessWidget {
  String? label;
  String hint;
  TextEditingController controller;
  double? borderRadius;

  AppTextField(
      {Key? key,
      this.label,
      required this.hint,
      required this.controller,
      this.borderRadius})
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
          style: const TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              labelText: hint,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
                borderSide:
                    const BorderSide(color: AppColor.primaryColor, width: 1),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
                borderSide: BorderSide(color: Colors.grey.shade300),
              )),
        ),
      )
    ]);
  }
}
