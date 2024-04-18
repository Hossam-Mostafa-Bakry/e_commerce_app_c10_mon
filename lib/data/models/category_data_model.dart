import '../../domain/entities/category_data_entity.dart';

class CategoryDataModel extends CategoryDataEntity {

  CategoryDataModel({
    required super.id,
    required super.name,
    required super.imageUrl,
  });

  factory CategoryDataModel.formJson(Map<String, dynamic> json) =>
      CategoryDataModel(
        id: json["_id"],
        name: json["name"],
        imageUrl: json["image"],
      );

}
