import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:mon_news_app/data/local/models/thanlwintimes_db.dart';

part 'categories_dao.g.dart';

@singleton
@DriftAccessor(tables: [CategoryDto])
class CategoriesDao extends DatabaseAccessor<ThanLwinTimesDatabase>
    with _$CategoriesDaoMixin {
  final ThanLwinTimesDatabase db;

  CategoriesDao(this.db) : super(db);

  Future<List<CategoryDtoData>> fetchAllCategories() =>
      select(categoryDto).get();

  Future<void> insertAllCategories(List<CategoryDtoData> categories) async {
    await batch((batch) => {
          batch.insertAllOnConflictUpdate(
              categoryDto,
              categories
                  .map((e) => CategoryDtoCompanion.insert(
                      name: e.name,
                      id: Value(e.id),
                      priority: e.priority,
                      topic: e.topic))
                  .toList())
        });
  }
}
