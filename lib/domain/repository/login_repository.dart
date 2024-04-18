import 'package:dartz/dartz.dart';
import '../../core/failure/failures.dart';

abstract class LoginRepository {

  Future<Either<Failure, bool>>  login(String email, String password);

}