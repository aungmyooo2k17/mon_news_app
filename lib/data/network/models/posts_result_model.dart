import 'package:mon_news_app/data/network/models/category_model.dart';
import 'package:mon_news_app/data/network/models/post_model.dart';

class PostsResultModel {
  List<PostModel>? posts;

  PostsResultModel({required this.posts});

  PostsResultModel.fromJson(List<dynamic> json) {
    print(json);
    if (json != null) {
      posts = [];
      for (var v in json) {
        posts?.add(PostModel.fromJson(v));
      }
    }
  }
}
