import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/post_entity.dart';

part 'post_detail_state.freezed.dart';

@freezed
class PostDetailState with _$PostDetailState {
  const factory PostDetailState.initial() = InitialState;
  const factory PostDetailState.loading() = LoadingState;
  const factory PostDetailState.error(String? message) = ErrorState;
  const factory PostDetailState.detail(PostEntity entities) = DetailState;
}
