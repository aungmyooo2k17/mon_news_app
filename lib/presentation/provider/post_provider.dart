import 'package:flutter/material.dart';
import 'package:mon_news_app/domain/post_entity.dart';

import '../../data/app_repo.dart';
import '../../helper/app_helper.dart';
import '../model/post_state.dart';

class PostProvider with ChangeNotifier {
  final AppRepo appRepo;

  PostState _postState = const PostState.initial();
  PostState get postState => _postState;

  PostProvider({required this.appRepo});

  int _currentPage = 1;
  List<PostEntity> _postList = [];
  bool _isCallProcessing = false;
  bool _isItemEmpty = false;

  void fetchPostsByTopicIdWithPagination(int topicId) async {
    try {
      if (_isCallProcessing || _isItemEmpty) {
        return;
      }
      _currentPage = _currentPage + 1;
      _isCallProcessing = true;
      final result = await appRepo.getPostsByTopicId(topicId, _currentPage, 5);
      _isCallProcessing = false;
      _isItemEmpty = result.length < 5;
      _postList.addAll(result);
      _postState = PostState.data(_postList);
    } catch (e) {
      _postState = PostState.error(e.toString());
    }
    notifyListeners();
  }

  void fetchPostsByTopicId(int topicId) async {
    try {
      _resetData();

      _postState = const PostState.loading();
      notifyListeners();
      _isCallProcessing = true;
      if (await AppHelper.hasConnection()) {
        appRepo.deleteAllPost();
      }

      final result = await appRepo.getPostsByTopicId(topicId, _currentPage, 5);
      _isCallProcessing = false;
      _postList.addAll(result);

      _postState = PostState.data(_postList);
    } catch (e) {
      _postState = PostState.error(e.toString());
    }
    notifyListeners();
  }

  void _resetData() {
    _isCallProcessing = false;
    _currentPage = 1;
    _isItemEmpty = false;
    _postList = [];
  }

  void removeBookmark(int bookmarkId) {
    _postList = _postList
        .map((e) => e.bookmarkId == bookmarkId
            ? e.copy(bookmarkId: null, isBookmark: false)
            : e)
        .toList();

    _postState = PostState.data(_postList);

    notifyListeners();
  }

  void addBookmark(int postId, int bookmarkId) {
    _postList = _postList
        .map((e) => e.id == postId
            ? e.copy(bookmarkId: bookmarkId, isBookmark: true)
            : e)
        .toList();

    _postState = PostState.data(_postList);

    notifyListeners();
  }
}
