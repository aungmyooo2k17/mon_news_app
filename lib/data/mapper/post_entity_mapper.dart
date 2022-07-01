import 'package:mon_news_app/domain/post_entity.dart';

import '../local/models/thanlwintimes_db.dart';

class PostEntityMapper {
  List<PostEntity> tos(List<PostDtoData> dtos) {
    return dtos.map((e) => to(e)).toList();
  }

  PostEntity to(PostDtoData dto) {
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
