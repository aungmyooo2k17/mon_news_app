import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mon_news_app/domain/post_entity.dart';

import '../../data/app_repo.dart';
import '../model/category_state.dart';
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

  void fetchPostsByTopicIdWithPagination(int topicId) async {
    try {
      if (_isCallProcessing || _isItemEmpty) {
        return;
      }
      _currentPage++;
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

      _postState = const PostState.loading();
      notifyListeners();
      _isCallProcessing = true;

      final result = await appRepo.getPostsByTopicId(topicId, _currentPage, 5);
      _isCallProcessing = false;
      _postList.addAll(result);

      _postState = PostState.data(_postList);
    } catch (e) {
      _postState = PostState.error(e.toString());
    }
    notifyListeners();
  }

  void resetData(){
    _isCallProcessing = false;
    _currentPage = 0;
    _isItemEmpty = false;
    _postList=[];
  }
}
