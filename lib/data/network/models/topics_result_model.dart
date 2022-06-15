import 'package:mon_news_app/data/network/models/topic_model.dart';

class TopicsResultModel {
  List<TopicModel>? topics;

  TopicsResultModel({required this.topics});

  TopicsResultModel.fromJson(List<dynamic> json) {
    // ignore: unnecessary_null_comparison
    if (json != null) {
      topics = [];
      for (var v in json) {
        topics?.add(TopicModel.fromJson(v));
      }
    }
  }
}
