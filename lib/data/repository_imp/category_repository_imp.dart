import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:e_commerce_app_c10_mon/core/failure/failure.dart';
import 'package:e_commerce_app_c10_mon/core/failure/failures.dart';
import 'package:e_commerce_app_c10_mon/data/data_source/category/category_data_source.dart';
import 'package:e_commerce_app_c10_mon/data/models/category_data_model.dart';
import 'package:e_commerce_app_c10_mon/domain/entities/category_data_entity.dart';

import '../../../domain/repository/category_repository.dart';

class CategoryRepositoryImp implements CategoryRepository {
  final CategoryDataSource categoryDataSource;

  CategoryRepositoryImp(this.categoryDataSource);

  @override
  Future<Either<Failure, List<CategoryDataEntity>>> getCategory() async {
    try {
      final response = await categoryDataSource.getCategory();

      List<CategoryDataEntity> data = [];
      if (response.statusCode == 200) {
        Iterable dataList = response.data["data"];

        for (var element in dataList) {
          data.add(CategoryDataModel.formJson(element));
        }

        return Right(data);
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (dioException) {
      return Left(
        ServerFailure(
          statusCode: dioException.response?.statusCode.toString() ?? "",
        ),
      );
    }
  }
}
