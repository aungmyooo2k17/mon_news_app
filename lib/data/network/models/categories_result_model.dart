import 'package:mon_news_app/data/network/models/category_model.dart';
import 'package:mon_news_app/data/network/models/topic_model.dart';

class CategoriesResultModel {
  List<CategoryModel>? categories;

  CategoriesResultModel({required this.categories});

  CategoriesResultModel.fromJson(List<dynamic> json) {
    // ignore: unnecessary_null_comparison
    if (json != null) {
      categories = [];
      for (var v in json) {
        categories?.add(CategoryModel.fromJson(v));
      }
    }
  }
}
