import 'package:dio/dio.dart';

import 'category_data_source.dart';

class CategoryDataSourceImp implements CategoryDataSource {

  final Dio dio;
  CategoryDataSourceImp(this.dio);

  @override
  Future<Response> getCategory() async {
    return dio.get(
      "/api/v1/categories",
    );
  }
}