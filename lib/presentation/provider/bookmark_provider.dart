import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mon_news_app/data/sharepreference/bookmark_preference.dart';
import 'package:mon_news_app/domain/post_entity.dart';

import '../../data/app_repo.dart';
import '../model/category_state.dart';
import '../model/post_state.dart';
import '../model/topic_state.dart';

class BookmarkProvider with ChangeNotifier {
  final AppRepo appRepo;

  PostState _postState = const PostState.initial();
  PostState get postState => _postState;

  BookmarkProvider({required this.appRepo});

  void fetchAllBookmarks() async {
    try {
      _postState = const PostState.loading();
      notifyListeners();
      final result = await appRepo.getBookmarks();
      _postState = PostState.data(result);
    } catch (e) {
      _postState = PostState.error(e.toString());
    }
    notifyListeners();
  }

  void fetchBookmarkById(int id) async {
    try {
      _postState = const PostState.loading();
      notifyListeners();
      final result = await appRepo.getBookmarksById(id);
      _postState = PostState.data(result);
    } catch (e) {
      _postState = PostState.error(e.toString());
    }
    notifyListeners();
  }

  void insertBookmark(PostEntity postEntity) async {
    try {
      _postState = const PostState.loading();
      notifyListeners();
      final result = await appRepo.insertBookmark(postEntity);
      BookmarkPreference.setBookmark(postEntity.id.toString());
      _postState = PostState.data(result);
    } catch (e) {
      _postState = PostState.error(e.toString());
    }
  }

  void deleteBookmark(int id) async {
    try {
      _postState = const PostState.loading();
      notifyListeners();
      final result = await appRepo.deleteBookmark(id);
      BookmarkPreference.removeBookmark(id.toString());
      _postState = PostState.data(result);
    } catch (e) {
      _postState = PostState.error(e.toString());
    }
  }
}
