import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:mon_news_app/data/local/models/thanlwintimes_db.dart';

part 'topics_dao.g.dart';

@singleton
@DriftAccessor(tables: [TopicDto])
class TopicsDao extends DatabaseAccessor<ThanLwinTimesDatabase>
    with _$TopicsDaoMixin {
  final ThanLwinTimesDatabase db;

  TopicsDao(this.db) : super(db);

  Future<List<TopicDtoData>> fetchAllTopics() => select(topicDto).get();

  Future<void> insertAllTopics(List<TopicDtoData> topics) async {
    await batch((batch) => {
          batch.insertAllOnConflictUpdate(
              topicDto,
              topics
                  .map((e) => TopicDtoCompanion.insert(
                      name: e.name, id: Value(e.id), priority: e.priority))
                  .toList())
        });
  }
}
