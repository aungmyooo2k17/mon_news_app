import 'package:mon_news_app/data/network/models/banner_model.dart';
import 'package:mon_news_app/data/network/models/category_model.dart';
import 'package:mon_news_app/data/network/models/topic_model.dart';

class PostModel {
  final int? id;
  final String? title;
  final BannerModel? banner;
  final String? videoUrl;
  final String? audioUrl;
  final String? content;
  final TopicModel? topic;
  final CategoryModel? category;

  PostModel(
      {required this.id,
      required this.title,
      required this.banner,
      required this.videoUrl,
      required this.audioUrl,
      required this.content,
      required this.topic,
      required this.category});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      banner: BannerModel.fromJson(json['banner']),
      videoUrl: json['video_url'],
      audioUrl: json['audio_url'],
      content: json['content'],
      topic: TopicModel.fromJson(json['topic']),
      category: CategoryModel.fromJson(json['category']),
    );
  }
}
