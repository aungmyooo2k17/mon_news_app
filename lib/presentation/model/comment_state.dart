import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mon_news_app/domain/comment_entity.dart';

part 'comment_state.freezed.dart';

@freezed
class CommentState with _$CommentState {
  const factory CommentState.initial() = InitialState;
  const factory CommentState.loading() = LoadingState;
  const factory CommentState.data(List<CommentEntity> entities) = DataState;
  const factory CommentState.commentedData(int response) = CommentedDataState;
  const factory CommentState.reportComment(int response) = ReportCommentState;
  const factory CommentState.error(String? message) = ErrorState;
}
