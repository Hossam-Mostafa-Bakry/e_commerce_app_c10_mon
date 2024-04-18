class CategoryDataEntity {

  final String id;
  final String name;
  final String imageUrl;

  const CategoryDataEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryDataEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ imageUrl.hashCode;
}
