import 'package:mon_news_app/data/local/models/thanlwintimes_db.dart';

import '../network/models/comment_model.dart';

class CommentDtoMapper {
  List<CommentDtoData> fromResponse(List<CommentModel> models) {
    return models.map((e) => from(e)).toList();
  }

  CommentDtoData from(CommentModel model) {
    return CommentDtoData(
        id: model.id,
        postId: model.postId,
        uuid: model.uuid,
        comment: model.comment);
  }
}
