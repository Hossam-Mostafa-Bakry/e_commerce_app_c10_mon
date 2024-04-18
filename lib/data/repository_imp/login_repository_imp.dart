import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app_c10_mon/core/services/snack_bar_service.dart';
import '../../core/failure/failures.dart';
import '../../data/data_source/login/login_data_source.dart';

import '../../domain/repository/login_repository.dart';

class LoginRepositoryImp implements LoginRepository {
  final LoginDataSource dataSource;

  LoginRepositoryImp(this.dataSource);

  @override
  Future<Either<Failure, bool>> login(String email, String password) async {
    try {
      final response = await dataSource.login(email, password);

      // data
      // null

      if (response.statusCode == 200) {
        // will save token
        return const Right(true);

      } else if (response.statusCode == 401) {

        SnackBarService.showErrorMessage(response.data["message"]);
        print(response.data["message"]);

        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
            message: response.data["message"],
          ),
        );

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
          message: dioException.response?.data["message"],
        ),
      );
    }
  }
}
