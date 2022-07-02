import 'package:mon_news_app/data/network/models/bookmark_model.dart';

class BookmarksResultModel {
  List<BookmarkModel>? bookmarks;

  BookmarksResultModel({required this.bookmarks});

  BookmarksResultModel.fromJson(List<dynamic> json) {
    // ignore: unnecessary_null_comparison
    if (json != null) {
      bookmarks = [];
      for (var v in json) {
        bookmarks?.add(BookmarkModel.fromJson(v));
      }
    }
  }
}
