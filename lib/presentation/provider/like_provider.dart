import 'package:flutter/material.dart';

import '../../data/app_repo.dart';
import '../model/like_state.dart';

class LikeProvider with ChangeNotifier {
  final AppRepo appRepo;

  LikeState _likeState = const LikeState.initial();
  LikeState get likeState => _likeState;

  LikeProvider({required this.appRepo});

  Future<int> postLike(String postId, String uuid) async {
    try {
      final result = await appRepo.postLike(postId, uuid);
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<int> deleteLike(int likeId) async {
    try {
      final result = await appRepo.deleteLike(likeId);
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
