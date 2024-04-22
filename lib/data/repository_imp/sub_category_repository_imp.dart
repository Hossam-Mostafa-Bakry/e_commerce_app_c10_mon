import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:e_commerce_app_c10_mon/core/failure/failure.dart';
import 'package:e_commerce_app_c10_mon/data/data_source/subCategory/sub_category_data_source.dart';
import 'package:e_commerce_app_c10_mon/data/models/sub_category_model.dart';

import 'package:e_commerce_app_c10_mon/domain/entities/sub_category_entity.dart';

import '../../core/failure/server_failure.dart';
import '../../domain/repository/sub_category_repository.dart';

class SubCategoryRepositoryImp implements SubCategoryRepository {
  final SubCategoryDataSource subCategoryDataSource;

  SubCategoryRepositoryImp(this.subCategoryDataSource);

  @override
  Future<Either<Failure, List<SubCategoryEntity>>> getSubCategory() async {
    try {
      final response = await subCategoryDataSource.getSubCategory();

      List<SubCategoryEntity> dataList = [];
      if (response.statusCode == 200) {
        Iterable data = response.data["data"];

        for (var element in data) {
          dataList.add(SubCategoryModel.fromJson(element));
        }

        return Right(dataList);
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
