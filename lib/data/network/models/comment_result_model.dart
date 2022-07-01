import 'package:mon_news_app/data/network/models/category_model.dart';
import 'package:mon_news_app/data/network/models/comment_model.dart';
import 'package:mon_news_app/data/network/models/post_model.dart';

class CommentsResultModel {
  List<CommentModel>? comments;

  CommentsResultModel({required this.comments});

  CommentsResultModel.fromJson(List<dynamic> json) {
    if (json != null) {
      comments = [];
      for (var v in json) {
        comments?.add(CommentModel.fromJson(v));
      }
    }
  }
}
