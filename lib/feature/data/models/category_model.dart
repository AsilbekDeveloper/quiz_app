import 'package:quiz_app/feature/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({required super.id, required super.categoryName});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"] as int? ?? 0,
      categoryName: json["name"] as String? ?? "No data",
    );
  }
}
