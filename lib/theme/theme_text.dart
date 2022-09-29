import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mon_news_app/theme/color_theme.dart';
import '../constants/size_constant.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get robotoTextTheme => GoogleFonts.robotoTextTheme();

  static TextStyle get _whiteHeadline6 => robotoTextTheme.headline6!.copyWith(
        fontSize: Sizes.dimen_20,
        color: Colors.white,
      );

  static TextStyle get whiteSubtitle1 => robotoTextTheme.subtitle1!.copyWith(
        fontSize: Sizes.dimen_16,
        color: Colors.white,
      );

  static TextStyle get whiteBodyText2 => robotoTextTheme.bodyText2!.copyWith(
        color: Colors.white,
        fontSize: Sizes.dimen_14,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle get _blackHeadline6 => robotoTextTheme.headline6!.copyWith(
        fontSize: Sizes.dimen_20,
        color: Colors.black87,
      );

  static TextStyle get blackSubtitle1 => robotoTextTheme.subtitle1!.copyWith(
      fontSize: Sizes.dimen_16,
      color: Colors.black87,
      fontWeight: FontWeight.bold);

  static TextStyle get blackBodyText2 => robotoTextTheme.bodyText2!.copyWith(
        color: Colors.black87,
        fontSize: Sizes.dimen_14,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle get newsItemTitle => robotoTextTheme.headline6!.copyWith(
      fontSize: Sizes.dimen_16,
      color: Colors.white,
      fontWeight: FontWeight.bold);

  static TextStyle get newsItemCreditAndTime =>
      robotoTextTheme.bodyText2!.copyWith(
        fontSize: Sizes.dimen_12,
        color: Colors.white,
      );

  static TextStyle get versionText => robotoTextTheme.bodyText2!.copyWith(
        fontSize: Sizes.dimen_12,
        color: Colors.black26,
      );

  static TextStyle get appbarTitle => robotoTextTheme.headline1!.copyWith(
      fontSize: Sizes.dimen_18,
      color: AppColor.primaryColor,
      fontWeight: FontWeight.bold);

  static TextStyle get textFieldLabel => robotoTextTheme.bodyText2!.copyWith(
        fontSize: Sizes.dimen_14,
        color: Colors.black87,
      );

  static TextStyle get title =>
      robotoTextTheme.titleLarge!.copyWith(fontSize: Sizes.dimen_20);

  static getTextTheme() => TextTheme(
        headline6: _whiteHeadline6,
        subtitle1: whiteSubtitle1,
        bodyText2: whiteBodyText2,
      );
}
