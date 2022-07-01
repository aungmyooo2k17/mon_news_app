import 'package:flutter/rendering.dart';

import '../local/models/thanlwintimes_db.dart';
import '../network/models/topic_model.dart';

class TopicDtoMapper {
  List<TopicDtoData> fromResponse(List<TopicModel> models) {
    return models.map((e) => from(e)).toList();
  }

  TopicDtoData from(TopicModel model) {
    return TopicDtoData(
        id: model.id ?? 0,
        name: model.name ?? '',
        priority: model.priority ?? 0);
  }
}
