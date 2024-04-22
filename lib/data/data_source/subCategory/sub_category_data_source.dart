import 'package:dio/dio.dart';

abstract class SubCategoryDataSource {

  Future<Response> getSubCategory();

}