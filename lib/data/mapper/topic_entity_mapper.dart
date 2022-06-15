import '../../domain/topic_entity.dart';
import '../local/models/thanlwintimes_db.dart';

class TopicEntityMapper {
  List<TopicEntity> tos(List<TopicDtoData> dtos) {
    return dtos.map((e) => to(e)).toList();
  }

  TopicEntity to(TopicDtoData dto) {
    return TopicEntity(id: dto.id, name: dto.name);
  }
}
