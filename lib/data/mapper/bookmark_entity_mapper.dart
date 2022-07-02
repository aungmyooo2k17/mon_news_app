import 'package:mon_news_app/domain/bookmark_entity.dart';
import '../local/models/thanlwintimes_db.dart';

class BookmarkEntityMapper {
  List<BookmarkEntity> tos(List<BookmarkDtoData> dtos) {
    return dtos.map((e) => to(e)).toList();
  }

  BookmarkEntity to(BookmarkDtoData dto) {
    return BookmarkEntity(
        id: dto.id, postId: dto.postId, uuid: dto.uuid, post: dto.post);
  }
}
