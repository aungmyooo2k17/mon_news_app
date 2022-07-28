import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mon_news_app/presentation/model/comment_state.dart';

import '../../data/app_repo.dart';
import '../model/category_state.dart';
import '../model/post_state.dart';
import '../model/topic_state.dart';

class CommentProvider with ChangeNotifier {
  final AppRepo appRepo;

  CommentState _commentState = const CommentState.initial();
  CommentState get commentState => _commentState;

  CommentProvider({required this.appRepo});

  void fetchAllComments(int postId) async {
    try {
      _commentState = const CommentState.loading();
      notifyListeners();
      final result = await appRepo.getCommentByPostId(postId);
      _commentState = CommentState.data(result);
    } catch (e) {
      _commentState = CommentState.error(e.toString());
    }
    notifyListeners();
  }

  void postComment(String postId, String comment, String uuid) async {
    try {
      _commentState = const CommentState.loading();
      notifyListeners();
      await appRepo.postComment(postId, comment, uuid);
      final result = await appRepo.getCommentByPostId(int.parse(postId));
      _commentState = CommentState.data(result);
    } catch (e) {
      _commentState = CommentState.error(e.toString());
    }
    notifyListeners();
  }

  Future<int> postCommentReport(int commentId, String reportReason) async {
    try {
      int result = await appRepo.postCommentReport(commentId, reportReason);
      return result;
    } catch (e) {
      _commentState = CommentState.error(e.toString());
    }
    return 0;
  }
}
