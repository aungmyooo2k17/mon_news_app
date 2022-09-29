import 'package:flutter/material.dart';
import 'package:mon_news_app/domain/post_entity.dart';

import '../../data/app_repo.dart';
import '../model/post_detail_state.dart';

class PostDetailProvider with ChangeNotifier {
  final AppRepo appRepo;

  PostDetailState _postState = const PostDetailState.initial();
  PostDetailState get postState => _postState;
  PostEntity? post;

  PostDetailProvider({required this.appRepo});

  void fetchPostDetail(int postId) async {
    try {
      _postState = const PostDetailState.loading();
      notifyListeners();
      final result = await appRepo.getPostDetail(postId);
      post = result;
      _postState = PostDetailState.detail(result);
    } catch (e) {
      _postState = PostDetailState.error(e.toString());
    }
    notifyListeners();
  }

  void removeLike(int likeId) {
    post = post?.copy(likeId: null, isliked: false, likes: post!.likes! - 1);
    _postState = PostDetailState.detail(post!);

    notifyListeners();
  }

  void addLike(int likeId) {
    post = post?.copy(likeId: likeId, isliked: true, likes: post!.likes! + 1);
    _postState = PostDetailState.detail(post!);

    notifyListeners();
  }

  void removeBookmark(int bookmarkId) {
    post = post?.copy(bookmarkId: null, isBookmark: false);
    _postState = PostDetailState.detail(post!);

    notifyListeners();
  }

  void addBookmark(int postId, int bookmarkId) {
    post = post?.copy(bookmarkId: bookmarkId, isBookmark: true);
    _postState = PostDetailState.detail(post!);

    notifyListeners();
  }
}
