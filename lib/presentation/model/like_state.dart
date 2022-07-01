import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_state.freezed.dart';

@freezed
class LikeState with _$LikeState {
  const factory LikeState.initial() = InitialState;
  const factory LikeState.loading() = LoadingState;
  const factory LikeState.data(int response) = DataState;
  const factory LikeState.error(String? message) = ErrorState;
}
