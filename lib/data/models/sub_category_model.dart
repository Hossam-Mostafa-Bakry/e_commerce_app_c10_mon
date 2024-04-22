import '../../domain/entities/sub_category_entity.dart';

class SubCategoryModel extends SubCategoryEntity {
  SubCategoryModel({
    required super.id,
    required super.categoryId,
    required super.name,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryModel(
        id: json["_id"],
        categoryId: json["category"],
        name: json["name"],
      );
}
