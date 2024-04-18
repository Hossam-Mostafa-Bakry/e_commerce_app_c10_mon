import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';

import 'login_data_source.dart';

class LoginDataSourceImp implements LoginDataSource {
  final Dio dio; // DIP
  LoginDataSourceImp(this.dio);

  @override
  Future<Response> login(String email, String password) async {
    return dio.post(
      "/api/v1/auth/signin",
      data: {
        "email": email,
        "password": password,
      },

    );
  }
}
