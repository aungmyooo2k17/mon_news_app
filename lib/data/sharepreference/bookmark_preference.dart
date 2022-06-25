import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class BookmarkPreference {
  BookmarkPreference._();

  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// ----------------------------------------------------------
  /// Generic routine to fetch an application preference
  /// ----------------------------------------------------------
  static Future<List<String>> getBookmark() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getStringList('bookmark') ?? [];
  }

  /// ----------------------------------------------------------
  /// Generic routine to saves an application preference
  /// ----------------------------------------------------------
  static Future<bool> setBookmark(String value) async {
    final SharedPreferences prefs = await _prefs;

    List<String> list = await getBookmark();
    print("bookmark: ${list.length}");
    list.add(value);

    return prefs.setStringList('bookmark', list);
  }

  static Future<bool> removeBookmark(String value) async {
    final SharedPreferences prefs = await _prefs;
    List<String> bookmarks = await getBookmark();
    bookmarks.remove(value);
    return prefs.setStringList('bookmark', bookmarks);
  }
}
