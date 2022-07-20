import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:mon_news_app/data/local/models/thanlwintimes_db.dart';

part 'comments_dao.g.dart';

@singleton
@DriftAccessor(tables: [CommentDto])
class CommentsDao extends DatabaseAccessor<ThanLwinTimesDatabase>
    with _$CommentsDaoMixin {
  final ThanLwinTimesDatabase db;

  CommentsDao(this.db) : super(db);

  Future<List<CommentDtoData>> fetchAllComments() => select(commentDto).get();
  Future<List<CommentDtoData>> fetchCommentByPostId(int postId) {
    return (select(commentDto)..where((tbl) => tbl.postId.equals(postId)))
        .get();
  }

  Future<void> insertAllComments(List<CommentDtoData> comments) async {
    (delete(commentDto)).go();
    await batch((batch) => {
          batch.insertAllOnConflictUpdate(
              commentDto,
              comments
                  .map((e) => CommentDtoCompanion.insert(
                      id: Value(e.id),
                      postId: e.postId,
                      comment: e.comment,
                      uuid: e.uuid))
                  .toList())
        });
  }
}
