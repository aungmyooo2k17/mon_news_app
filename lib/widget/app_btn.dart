import 'package:flutter/material.dart';
import 'package:mon_news_app/theme/color_theme.dart';

class AppBtn extends StatelessWidget {
  String label;
  VoidCallback? onTap;
  double? borderRadius;
  AppBtn({Key? key, required this.label, this.onTap, this.borderRadius})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        primary: AppColor.primaryColor,
        minimumSize: const Size.fromHeight(48),
        // minimumSize: const Size(88, 36),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8.0)),
        ),
      ),
      onPressed: onTap,
      child: Text(label),
    );
  }
}
