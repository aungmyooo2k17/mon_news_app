import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mon_news_app/domain/bookmark_entity.dart';

part 'bookmark_state.freezed.dart';

@freezed
class BookmarkState with _$BookmarkState {
  const factory BookmarkState.initial() = InitialState;
  const factory BookmarkState.loading() = LoadingState;
  const factory BookmarkState.data(List<BookmarkEntity> entities) = DataState;
  const factory BookmarkState.error(String? message) = ErrorState;
}
