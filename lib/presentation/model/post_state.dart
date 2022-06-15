import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/post_entity.dart';

part 'post_state.freezed.dart';

@freezed
class PostState with _$PostState {
  const factory PostState.initial() = InitialState;
  const factory PostState.loading() = LoadingState;
  const factory PostState.data(List<PostEntity> entities) = DataState;
  const factory PostState.error(String? message) = ErrorState;
}
