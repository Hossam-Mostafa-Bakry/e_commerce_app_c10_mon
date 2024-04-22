import 'package:dio/dio.dart';

abstract class ProductDataSource {

  Future<Response> getProducts();

}