import 'package:flutter/rendering.dart';
import 'package:mon_news_app/data/local/models/thanlwintimes_db.dart';
import 'package:mon_news_app/domain/post_entity.dart';

import '../network/models/category_model.dart';
import '../network/models/post_model.dart';

class BookmarkDtoMapper {
  // List<BookmarkDtoData> fromResponse(List<PostModel> models) {
  //   return models.map((e) => from(e)).toList();
  // }

  BookmarkDtoData from(PostEntity model) {
    return BookmarkDtoData(
        id: model.id,
        banner: model.banner,
        topic: model.topic,
        title: model.title,
        category: model.category,
        content: model.content,
        audioUrl: '',
        videoUrl: '');
  }
}
