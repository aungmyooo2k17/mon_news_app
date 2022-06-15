import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/topic_entity.dart';

part 'topic_state.freezed.dart';

@freezed
class TopicState with _$TopicState {
  const factory TopicState.initial() = InitialState;
  const factory TopicState.loading() = LoadingState;
  const factory TopicState.data(List<TopicEntity> entities) = DataState;
  const factory TopicState.error(String? message) = ErrorState;
}
