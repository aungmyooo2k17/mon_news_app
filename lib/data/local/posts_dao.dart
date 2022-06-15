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

  Future<List<PostDtoData>> fetchAllPostsByTopicId(int topicId) {
    return (select(postDto)..where((tbl) => tbl.topicId.equals(topicId))).get();
  }

  Future<void> insertAllPosts(List<PostDtoData> posts) async {
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
                      banner: e.banner))
                  .toList())
        });
  }
}
