import 'package:dartz/dartz.dart';
import '../../core/failure/failures.dart';
import '../../domain/entities/register_request_data.dart';

abstract class RegisterRepository {

  Future<Either<Failure, bool>> register(RegisterRequestData data);

}