import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:e_commerce_app_c10_mon/core/failure/failure.dart';
import 'package:e_commerce_app_c10_mon/core/failure/server_failure.dart';
import 'package:e_commerce_app_c10_mon/data/data_source/register/register_data_source.dart';

import 'package:e_commerce_app_c10_mon/domain/entities/register_request_data.dart';

import '../../domain/repository/register_repository.dart';

class RegisterRepositoryImp implements RegisterRepository {
  final RegisterDataSource registerDataSource;

  RegisterRepositoryImp(this.registerDataSource);

  @override
  Future<Either<Failure, bool>> register(RegisterRequestData data) async {
    try {
      final response = await registerDataSource.register(data);

      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(ServerFailure(
          statusCode: response.statusCode.toString(),
          message: response.data["message"],
        ));
      }
    } on DioException catch (dioException) {
      return Left(
        ServerFailure(
          statusCode: dioException.response?.statusCode.toString() ?? "",
          message: dioException.response?.data["message"],
        ),
      );
    }
  }
}
