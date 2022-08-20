import 'package:flutter/rendering.dart';

import '../local/models/thanlwintimes_db.dart';
import '../network/models/post_model.dart';

class PostDtoMapper {
  List<PostDtoData> fromResponse(List<PostModel> models) {
    return models.map((e) => from(e)).toList();
  }

  PostDtoData from(PostModel model) {
    return PostDtoData(
        id: model.id ?? 0,
        banner: model.banner?.url ?? '',
        topic: model.topic?.name ?? '',
        topicId: model.topic?.id ?? 0,
        title: model.title ?? '',
        category: model.category?.name ?? '',
        content: model.content ?? '',
        audioUrl: model.audioUrl ?? '',
        videoUrl: model.videoUrl ?? '',
        shareLink: model.shareLink ?? "");
  }
}
