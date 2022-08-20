import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

const String selectedLang = "selectedLang";
const String authCode = "auth";

Future setLocale(String languageCode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(selectedLang, languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString(selectedLang) ?? 'en';
  return Locale(languageCode);
}

Future setAuth(String auth) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(authCode, auth);
}

Future<String> getAuth() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String autho = prefs.getString(authCode) ?? '';
  return autho;
}
