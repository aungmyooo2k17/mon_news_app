import 'package:mon_news_app/data/network/models/post_model.dart';

class BookmarkModel {
  final int id;
  final int postId;
  final String uuid;
  final PostModel postModel;

  BookmarkModel(
      {required this.id,
      required this.postId,
      required this.uuid,
      required this.postModel});

  factory BookmarkModel.fromJson(Map<String, dynamic> json) {
    return BookmarkModel(
      id: json['id'],
      postId: json['post_id'],
      uuid: json['uuid'],
      postModel: PostModel.fromJson(json['post']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'post_id': postId,
      'uuid': uuid,
      'post': postModel,
    };
  }
}
