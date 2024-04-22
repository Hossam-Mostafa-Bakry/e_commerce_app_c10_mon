class SubCategoryEntity {
  final String id;
  final String categoryId;
  final String name;
  final String? image;

  SubCategoryEntity({
    required this.id,
    required this.categoryId,
    required this.name,
    this.image
  });
}
