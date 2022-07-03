import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mon_news_app/domain/post_entity.dart';

import '../../data/app_repo.dart';
import '../model/category_state.dart';
import '../model/post_state.dart';

class PostDetailProvider with ChangeNotifier {
  final AppRepo appRepo;

  PostState _postState = const PostState.initial();
  PostState get postState => _postState;
  PostEntity? post;

  PostDetailProvider({required this.appRepo});

  void fetchPostDetail(int postId) async {
    try {
      _postState = const PostState.loading();
      notifyListeners();
      final result = await appRepo.getPostDetail(postId);
      post = result;
      _postState = PostState.detail(result);
    } catch (e) {
      _postState = PostState.error(e.toString());
    }
    notifyListeners();
  }

  void removeBookmark(int bookmarkId) {
    post = post?.copy(bookmarkId: null, isBookmark: false);
    _postState = PostState.detail(post!);

    notifyListeners();
  }

  void addBookmark(int postId, int bookmarkId) {
    post = post?.copy(bookmarkId: bookmarkId, isBookmark: true);
    _postState = PostState.detail(post!);

    notifyListeners();
  }
}
