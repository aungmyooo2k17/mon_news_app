import 'package:mon_news_app/data/network/models/topic_model.dart';

class CategoryModel {
  final int? id;
  final String? name;
  final int? priority;
  final TopicModel? topic;

  CategoryModel({this.id, this.name, this.priority, this.topic});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? "",
        priority: json['priority'] ?? 0,
        topic: TopicModel.fromJson(json['topic'] ?? {}));
  }
}
