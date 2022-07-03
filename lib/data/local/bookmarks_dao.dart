import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:mon_news_app/data/local/models/thanlwintimes_db.dart';

part 'bookmarks_dao.g.dart';

@singleton
@DriftAccessor(tables: [BookmarkDto])
class BookmarksDao extends DatabaseAccessor<ThanLwinTimesDatabase>
    with _$BookmarksDaoMixin {
  final ThanLwinTimesDatabase db;

  BookmarksDao(this.db) : super(db);

  Future<List<BookmarkDtoData>> fetchAllBookmark() => select(bookmarkDto).get();

  Future<void> addBookmark(BookmarkDtoData entry) {
    return into(bookmarkDto).insert(entry);
  }

  Future<void> deleteBookmark(int id) {
    return (delete(bookmarkDto)..where((t) => t.bookmarkId.equals(id))).go();
  }

  Future<void> insertAllBookmarks(List<BookmarkDtoData> bookmarks) async {
    (delete(bookmarkDto)).go();
    await batch((batch) => {
          batch.insertAllOnConflictUpdate(
              bookmarkDto,
              bookmarks
                  .map((e) => BookmarkDtoCompanion.insert(
                      bookmarkId: e.bookmarkId,
                      postId: e.postId,
                      uuid: e.uuid,
                      audioUrl: e.audioUrl,
                      videoUrl: e.videoUrl,
                      banner: e.banner,
                      category: e.category,
                      content: e.content,
                      title: e.title,
                      topic: e.topic,
                      topicId: e.topicId))
                  .toList())
        });
  }
}
