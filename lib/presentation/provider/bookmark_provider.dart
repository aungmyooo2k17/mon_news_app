import 'package:flutter/material.dart';
import 'package:mon_news_app/data/sharepreference/bookmark_preference.dart';

import '../../data/app_repo.dart';
import '../model/bookmark_state.dart';

class BookmarkProvider with ChangeNotifier {
  final AppRepo appRepo;

  BookmarkState _postState = const BookmarkState.initial();
  BookmarkState get postState => _postState;

  BookmarkProvider({required this.appRepo});

  void fetchBookmarkById(String uuid) async {
    try {
      _postState = const BookmarkState.loading();
      notifyListeners();
      final result = await appRepo.getBookmarksById(uuid);
      _postState = BookmarkState.data(result);
    } catch (e) {
      _postState = BookmarkState.error(e.toString());
    }
    notifyListeners();
  }

  void insertBookmark(String postId, String uuid) async {
    try {
      _postState = const BookmarkState.loading();
      notifyListeners();
      await appRepo.insertBookmark(postId, uuid);
      final result = await appRepo.getBookmarksById(uuid);
      _postState = BookmarkState.data(result);
    } catch (e) {
      _postState = BookmarkState.error(e.toString());
    }
  }

  void deleteBookmark(int id, String uuid) async {
    try {
      _postState = const BookmarkState.loading();
      notifyListeners();
      await appRepo.deleteBookmark(id);
      final result = await appRepo.getBookmarksById(uuid);
      _postState = BookmarkState.data(result);
    } catch (e) {
      _postState = BookmarkState.error(e.toString());
    }
  }
}
