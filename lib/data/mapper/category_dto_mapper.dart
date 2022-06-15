import 'package:flutter/rendering.dart';
import 'package:mon_news_app/data/local/models/thanlwintimes_db.dart';

import '../network/models/category_model.dart';

class CategoryDtoMapper {
  List<CategoryDtoData> fromResponse(List<CategoryModel> models) {
    return models.map((e) => from(e)).toList();
  }

  CategoryDtoData from(CategoryModel model) {
    return CategoryDtoData(
      id: model.id,
      name: model.name,
      priority: model.priority,
      topic: model.topic?.name ?? '',
    );
  }
}
