import 'package:dio/dio.dart';

import 'sub_category_data_source.dart';

class SubCategoryDataSourceImp implements SubCategoryDataSource {
  final Dio dio;

  SubCategoryDataSourceImp(this.dio);

  @override
  Future<Response> getSubCategory() async {
    return await dio.get(
      "/api/v1/subcategories",
    );
  }
}
