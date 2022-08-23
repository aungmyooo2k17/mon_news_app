import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../data/app_repo.dart';
import '../model/topic_state.dart';

class TopicProvider with ChangeNotifier {
  final AppRepo topicRepo;

  TopicState _topicState = const TopicState.initial();
  TopicState get topicState => _topicState;

  TopicProvider({required this.topicRepo});

  void fetchAllTopics() async {
    try {
      if(_topicState is DataState){
        return;
      }
      _topicState = const TopicState.loading();
      notifyListeners();
      final result = await topicRepo.getTopics();
      _topicState = TopicState.data(result);
    } catch (e) {
      _topicState = TopicState.error(e.toString());
    }
    notifyListeners();
  }
}
