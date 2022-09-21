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
  final int? views;
  final int? comments;
  final int? likes;
  final String? shareLink;
  final String? publishedAt;

  PostModel(
      {required this.id,
      required this.title,
      required this.banner,
      required this.videoUrl,
      required this.audioUrl,
      required this.content,
      this.topic,
      this.category,
      this.views,
      this.comments,
      this.likes,
      this.shareLink,
      this.publishedAt});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        id: json['id'],
        title: json['title'],
        banner: BannerModel.fromJson(json['banner']),
        videoUrl: json['video_url'],
        audioUrl: json['audio_url'],
        content: json['content'],
        topic: TopicModel.fromJson(json['topic'] ?? {}),
        category: CategoryModel.fromJson(json['category'] ?? {}),
        publishedAt: json['published_at']);
  }
  factory PostModel.fromJsonDetail(Map<String, dynamic> json) {
    return PostModel(
        id: json['id'],
        title: json['title'],
        banner: BannerModel.fromJson(json['banner']),
        videoUrl: json['video_url'],
        audioUrl: json['audio_url'],
        content: json['content'],
        views: json['views'] ?? 0,
        likes: json['likes'] ?? 0,
        shareLink: json['share_link'] ?? "",
        comments: json['comments'] ?? 0,
        topic: TopicModel.fromJson(json['topic'] ?? {}),
        category: CategoryModel.fromJson(json['category'] ?? {}),
        publishedAt: json['published_at']);
  }
}
