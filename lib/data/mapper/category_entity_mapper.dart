import '../../domain/category_entity.dart';
import '../local/models/thanlwintimes_db.dart';

class CategoryEntityMapper {
  List<CategoryEntity> tos(List<CategoryDtoData> dtos) {
    return dtos.map((e) => to(e)).toList();
  }

  CategoryEntity to(CategoryDtoData dto) {
    return CategoryEntity(id: dto.id, name: dto.name);
  }
}
