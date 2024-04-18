import 'package:dartz/dartz.dart';
import '../repository/login_repository.dart';

import '../../core/failure/failure.dart';

class LoginUseCase {


  final LoginRepository repository;
  LoginUseCase(this.repository);

  Future<Either<Failure, bool>> execute(String email, String password) async {
    return await repository.login(email, password);
  }

}