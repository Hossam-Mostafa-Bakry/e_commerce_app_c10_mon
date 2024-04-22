import 'package:e_commerce_app_c10_mon/domain/entities/sub_category_entity.dart';

class CategoryDataEntity {
  final String id;
  final String name;
  final String imageUrl;
  List<SubCategoryEntity>? subCategories;

  CategoryDataEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.subCategories,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryDataEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          imageUrl == other.imageUrl &&
          subCategories == other.subCategories;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ imageUrl.hashCode ^ subCategories.hashCode;
}
