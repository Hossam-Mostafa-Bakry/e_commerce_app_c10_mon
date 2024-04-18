import 'package:e_commerce_app_c10_mon/core/services/snack_bar_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../core/failure/failures.dart';
import '../../../core/services/web_serivces.dart';
import '../../../data/data_source/register/register_data_source.dart';
import '../../../data/data_source/register/register_data_source_imp.dart';
import '../../../data/repository_imp/register_repository_imp.dart';
import '../../../domain/entities/register_request_data.dart';
import '../../../domain/repository/register_repository.dart';
import '../../../domain/use_cases/register_use_case.dart';
import '../../../features/registration/manager/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterLoadingState());

  final WebServices _services = WebServices();
  late RegisterUseCase registerUseCase;
  late RegisterRepository registerRepository;
  late RegisterDataSource registerDataSource;

  Future<bool> register(RegisterRequestData data) async {
    registerDataSource = RegisterDataSourceImp(_services.freeDio);
    registerRepository = RegisterRepositoryImp(registerDataSource);
    registerUseCase = RegisterUseCase(registerRepository);

    EasyLoading.show();
    final result = await registerUseCase.execute(data);

    return result.fold(
      (fail) {
        var error = fail as ServerFailure;

        EasyLoading.dismiss();
        SnackBarService.showErrorMessage(error.message!);
        return Future.value(false);
      },
      (data) {
        EasyLoading.dismiss();
        return Future.value(true);
      },
    );
  }
}
