import 'package:flutter/material.dart';
import 'package:mon_news_app/theme/color_theme.dart';

class AppBtnOutline extends StatelessWidget {
  String label;
  AppBtnOutline({Key? key, required this.label}) : super(key: key);
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.grey,
    primary: Colors.white,
    minimumSize: const Size.fromHeight(40),
    // minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
      side: BorderSide(color: AppColor.primaryColor),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: raisedButtonStyle,
      onPressed: () {},
      child: Text(label),
    );
  }
}
