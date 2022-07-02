import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../data/app_repo.dart';
import '../model/category_state.dart';
import '../model/post_state.dart';
import '../model/topic_state.dart';

class PostProvider with ChangeNotifier {
  final AppRepo appRepo;

  PostState _postState = const PostState.initial();
  PostState get postState => _postState;

  PostProvider({required this.appRepo});

  void fetchAllPosts() async {
    try {
      _postState = const PostState.loading();
      notifyListeners();
      final result = await appRepo.getPosts();
      _postState = PostState.data(result);
    } catch (e) {
      _postState = PostState.error(e.toString());
    }
    notifyListeners();
  }

  void fetchPostsByTopicIdWithPagination(
      int topicId, int page, int perPage) async {
    try {
      final result = await appRepo.getPostsByTopicId(topicId, page, perPage);
      _postState = PostState.data(result);
    } catch (e) {
      _postState = PostState.error(e.toString());
    }
    notifyListeners();
  }

  void fetchPostsByTopicId(int topicId) async {
    try {
      _postState = const PostState.loading();
      notifyListeners();
      final result = await appRepo.getPostsByTopicId(topicId, 1, 5);
      _postState = PostState.data(result);
    } catch (e) {
      _postState = PostState.error(e.toString());
    }
    notifyListeners();
  }
}
