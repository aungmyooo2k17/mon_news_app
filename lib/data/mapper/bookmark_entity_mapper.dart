import 'package:mon_news_app/domain/post_entity.dart';
import '../local/models/thanlwintimes_db.dart';

class BookmarkEntityMapper {
  List<PostEntity> tos(List<BookmarkDtoData> dtos) {
    return dtos.map((e) => to(e)).toList();
  }

  PostEntity to(BookmarkDtoData dto) {
    return PostEntity(
      id: dto.id,
      title: dto.title,
      videoUrl: dto.videoUrl,
      content: dto.content,
      topic: dto.topic,
      banner: dto.banner,
      category: dto.category,
      audioUrl: dto.audioUrl,
    );
  }
}
