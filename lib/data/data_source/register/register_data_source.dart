import 'package:dio/dio.dart';
import 'package:e_commerce_app_c10_mon/domain/entities/register_request_data.dart';

abstract class RegisterDataSource {

  Future<Response> register(RegisterRequestData data);

}
