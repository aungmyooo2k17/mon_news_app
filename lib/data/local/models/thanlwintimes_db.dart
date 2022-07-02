import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:mon_news_app/data/local/bookmarks_dao.dart';
import 'package:mon_news_app/data/local/comments_dao.dart';
import 'package:mon_news_app/data/local/posts_dao.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../categories_dao.dart';
import '../topics_dao.dart';

part 'thanlwintimes_db.g.dart';

class TopicDto extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  IntColumn get priority => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class CategoryDto extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  IntColumn get priority => integer()();
  TextColumn get topic => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class CommentDto extends Table {
  IntColumn get id => integer()();
  IntColumn get postId => integer()();
  TextColumn get comment => text()();
  TextColumn get uuid => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class PostDto extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get banner => text()();
  TextColumn get videoUrl => text()();
  TextColumn get audioUrl => text()();
  TextColumn get content => text()();
  IntColumn get topicId => integer()();
  TextColumn get topic => text()();
  TextColumn get category => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class BookmarkDto extends Table {
  IntColumn get id => integer()();
  IntColumn get postId => integer()();
  TextColumn get uuid => text()();
  TextColumn get post => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@singleton
@DriftDatabase(
    tables: [TopicDto, CategoryDto, PostDto, BookmarkDto, CommentDto],
    daos: [TopicsDao, CategoriesDao, PostsDao, BookmarksDao, CommentsDao])
class ThanLwinTimesDatabase extends _$ThanLwinTimesDatabase {
  ThanLwinTimesDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
