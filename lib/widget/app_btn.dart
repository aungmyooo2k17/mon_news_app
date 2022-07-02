import 'package:flutter/material.dart';
import 'package:mon_news_app/theme/color_theme.dart';

class AppBtn extends StatelessWidget {
  String label;
  VoidCallback? onTap;
  AppBtn({Key? key, required this.label, this.onTap}) : super(key: key);
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: AppColor.primaryColor,
    minimumSize: const Size.fromHeight(40),
    // minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: raisedButtonStyle,
      onPressed: onTap,
      child: Text(label),
    );
  }
}
