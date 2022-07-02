import 'package:mon_news_app/data/network/models/bookmark_model.dart';
import 'package:mon_news_app/domain/post_entity.dart';

class BookmarkEntity {
  final int id;
  final int postId;
  final String uuid;
  final String post;

  BookmarkEntity(
      {required this.id,
      required this.postId,
      required this.uuid,
      required this.post});
}
