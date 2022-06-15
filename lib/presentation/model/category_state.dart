import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/category_entity.dart';

part 'category_state.freezed.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = InitialState;
  const factory CategoryState.loading() = LoadingState;
  const factory CategoryState.data(List<CategoryEntity> entities) = DataState;
  const factory CategoryState.error(String? message) = ErrorState;
}
