import 'package:flutter/material.dart';

import '../../data/app_repo.dart';
import '../model/like_state.dart';

class LikeProvider with ChangeNotifier {
  final AppRepo appRepo;

  LikeState _likeState = const LikeState.initial();
  LikeState get likeState => _likeState;

  LikeProvider({required this.appRepo});

  void postLike(String postId, String uuid) async {
    try {
      _likeState = const LikeState.loading();
      notifyListeners();
      final result = await appRepo.postLike(postId, uuid);
      _likeState = LikeState.data(result);
    } catch (e) {
      _likeState = LikeState.error(e.toString());
    }
    notifyListeners();
  }
}
