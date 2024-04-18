import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c10_mon/domain/entities/register_request_data.dart';

import '../../core/failure/failures.dart';
import '../../domain/repository/register_repository.dart';

class RegisterUseCase {

  final RegisterRepository registerRepository;
  RegisterUseCase(this.registerRepository);

  Future<Either<Failure, bool>> execute(RegisterRequestData data) async {
    return await registerRepository.register(data);
  }

}