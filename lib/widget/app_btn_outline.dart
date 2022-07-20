import 'package:flutter/material.dart';
import 'package:mon_news_app/theme/color_theme.dart';

class AppBtnOutline extends StatelessWidget {
  String? label;
  Color? color;
  VoidCallback? onPressed;

  AppBtnOutline({Key? key, this.label, this.color, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.black87,
        primary: Colors.white,
        // minimumSize: const Size.fromHeight(40),
        minimumSize: const Size(88, 36),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          side: BorderSide(color: color ?? AppColor.primaryColor),
        ),
      ),
      onPressed: onPressed,
      child: Text(label ?? "Default text"),
    );
  }
}
