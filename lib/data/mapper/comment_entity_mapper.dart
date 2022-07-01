import '../../domain/comment_entity.dart';
import '../local/models/thanlwintimes_db.dart';

class CommentEntityMapper {
  List<CommentEntity> tos(List<CommentDtoData> dtos) {
    return dtos.map((e) => to(e)).toList();
  }

  CommentEntity to(CommentDtoData dto) {
    return CommentEntity(
        id: dto.id, uuid: dto.uuid, comment: dto.comment, postId: dto.postId);
  }
}
