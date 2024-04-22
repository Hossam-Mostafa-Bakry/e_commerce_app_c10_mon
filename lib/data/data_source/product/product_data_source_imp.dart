import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';

import 'products_data_source.dart';

class ProductDataSourceImp implements ProductDataSource {
  final Dio dio;

  ProductDataSourceImp(this.dio);

  @override
  Future<Response> getProducts() async {
    return await dio.get(
      "/api/v1/products",
    );
  }
}
