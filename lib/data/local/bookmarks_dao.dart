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

  Future<List<BookmarkDtoData>> fetchAllBookmarkById(int id) {
    return (select(bookmarkDto)..where((tbl) => tbl.id.equals(id))).get();
  }

  Future<void> addBookmark(BookmarkDtoData entry) {
    return into(bookmarkDto).insert(entry);
  }

  Future<void> deleteBookmark(int id) {
    return (delete(bookmarkDto)..where((t) => t.id.equals(id))).go();
  }
}
