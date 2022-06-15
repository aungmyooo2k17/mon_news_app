import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../data/app_repo.dart';
import '../model/category_state.dart';
import '../model/topic_state.dart';

class CategoryProvider with ChangeNotifier {
  final AppRepo appRepo;

  CategoryState _categoryState = const CategoryState.initial();
  CategoryState get topicState => _categoryState;

  CategoryProvider({required this.appRepo});

  void fetchAllCategorys() async {
    try {
      _categoryState = const CategoryState.loading();
      notifyListeners();
      final result = await appRepo.getCategories();
      _categoryState = CategoryState.data(result);
    } catch (e) {
      _categoryState = CategoryState.error(e.toString());
    }
    notifyListeners();
  }
}
