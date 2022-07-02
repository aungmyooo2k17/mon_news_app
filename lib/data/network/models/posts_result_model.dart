import 'package:mon_news_app/data/network/models/category_model.dart';
import 'package:mon_news_app/data/network/models/post_model.dart';

class PostsResultModel {
  List<PostModel>? posts;
  int? perPage;
  int? currentPage;
  int? previousPage;
  int? nextPage;
  int? total;

  PostsResultModel(
      {required this.posts,
      this.perPage,
      this.currentPage,
      this.previousPage,
      this.nextPage,
      this.total});

  PostsResultModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      posts = [];
      json['data'].forEach((v) {
        posts?.add(PostModel.fromJson(v));
      });
    }
  }
}
