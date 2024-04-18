import 'package:dio/dio.dart';
import '../../../core/failure/failures.dart';
import '../../../core/services/web_serivces.dart';
import '../../../data/data_source/login/login_data_source.dart';
import '../../../data/data_source/login/login_data_source_imp.dart';
import '../../../data/repository_imp/login_repository_imp.dart';
import '../../../domain/repository/login_repository.dart';
import '../../../domain/use_cases/login_use_case.dart';
import '../../../features/login/manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoadingLoginState());

  late LoginUseCase loginUseCase;
  late LoginRepository loginRepository;
  late LoginDataSource loginDataSource;

  Future<bool> login(String email, String password) async {
    emit(LoadingLoginState());
    WebServices service = WebServices();
    loginDataSource = LoginDataSourceImp(service.freeDio);
    loginRepository = LoginRepositoryImp(loginDataSource);
    loginUseCase = LoginUseCase(loginRepository);

    final result = await loginUseCase.execute(email, password);

    return result.fold(
      (fail) {
        var error = fail as ServerFailure;

        emit(ErrorLoginState());
        return Future.value(false);
      },
      (date) {
        emit(SuccessLoginState());
        return Future.value(true);
      },
    );
  }
}
