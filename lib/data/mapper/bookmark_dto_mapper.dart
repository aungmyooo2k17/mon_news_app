import 'package:flutter/rendering.dart';
import 'package:mon_news_app/data/local/models/thanlwintimes_db.dart';
import 'package:mon_news_app/data/network/models/bookmark_model.dart';
import 'package:mon_news_app/domain/bookmark_entity.dart';
import 'package:mon_news_app/domain/post_entity.dart';

class BookmarkDtoMapper {
  List<BookmarkDtoData> fromResponse(List<BookmarkModel> models) {
    return models.map((e) => from(e)).toList();
  }

  BookmarkDtoData from(BookmarkModel model) {
    return BookmarkDtoData(
        id: model.id,
        postId: model.postId,
        post: model.postModel.title ?? "",
        uuid: model.uuid);
  }
}
