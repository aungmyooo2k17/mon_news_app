import 'package:mon_news_app/data/network/models/topic_model.dart';

class CategoryModel {
  final int id;
  final String name;
  final int priority;
  final TopicModel? topic;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.priority,
      this.topic});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'],
        name: json['name'],
        priority: json['priority'],
        topic: TopicModel.fromJson(json['topic'] ?? {}));
  }
}
