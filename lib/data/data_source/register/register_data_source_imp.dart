import 'package:dio/dio.dart';

import '../../../data/data_source/register/register_data_source.dart';
import '../../../domain/entities/register_request_data.dart';

class RegisterDataSourceImp implements RegisterDataSource {

  final Dio dio;

  RegisterDataSourceImp(this.dio);


  @override
  Future<Response> register(RegisterRequestData data) async {
    return await dio.post(
        "/api/v1/auth/signup",
        data: {
          "name": data.name,
          "email": data.email,
          "password": data.password,
          "rePassword": data.password,
          "phone": data.phone,
        }
    );
  }
}