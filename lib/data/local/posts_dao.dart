import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:mon_news_app/data/local/models/thanlwintimes_db.dart';

part 'posts_dao.g.dart';

@singleton
@DriftAccessor(tables: [PostDto])
class PostsDao extends DatabaseAccessor<ThanLwinTimesDatabase>
    with _$PostsDaoMixin {
  final ThanLwinTimesDatabase db;

  PostsDao(this.db) : super(db);

  Future<List<PostDtoData>> fetchAllPosts() => select(postDto).get();

  Future<PostDtoData> fetchPostById(int postId) {
    return (select(postDto)..where((tbl) => tbl.id.equals(postId))).getSingle();
  }

  Future updatePost(
      int postId, int views, int likes, int comments, String shareLink) {
    return (update(postDto)..where((t) => t.id.equals(postId))).write(
      PostDtoCompanion(
          views: Value(views),
          likes: Value(likes),
          comments: Value(comments),
          shareLink: Value(shareLink)),
    );
  }

  Future<List<PostDtoData>> fetchAllPostsByTopicId(
      int topicId, int limit, int offset) {
    return (select(postDto)
          ..where((tbl) => tbl.topicId.equals(topicId))
          ..limit(limit, offset: offset))
        .get();
  }

  Future<void> insertAllPosts(List<PostDtoData> posts) async {
    (delete(postDto)).go();
    await batch((batch) => {
          batch.insertAllOnConflictUpdate(
              postDto,
              posts
                  .map((e) => PostDtoCompanion.insert(
                      title: e.title,
                      id: Value(e.id),
                      topic: e.topic,
                      topicId: e.topicId,
                      videoUrl: e.videoUrl,
                      category: e.category,
                      content: e.content,
                      audioUrl: e.audioUrl,
                      banner: e.banner,
                      shareLink: e.shareLink))
                  .toList())
        });
  }
}
