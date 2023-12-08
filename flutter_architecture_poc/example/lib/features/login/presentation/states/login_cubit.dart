import 'package:example/core/persistent_data_service/base_persistent_data_service.dart';
import 'package:example/features/login/interactor/base_login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.service, this.persistentDataService)
      : super(const LoginLoggedOutState());

  final BaseLoginService service;
  final BasePersistentDataService persistentDataService;

  final String loginIdKey = 'login_id_key';

  Future<String> get loginId async =>
      await persistentDataService.read<String?>(loginIdKey) ?? '';

  Future<void> get isLoggedIn async {
    emit(const LoginLoadingState());

    final String? loginId =
        await persistentDataService.read<String?>(loginIdKey);

    emit(
      loginId == null
          ? const LoginLoggedOutState()
          : LoginLoggedInState(loginId),
    );
  }

  Future<void> authorize(String token) async {
    try {
      emit(const LoginLoadingState());
      emit(LoginLoggedInState(await _getLoginId(token)));
    } on Exception catch (e) {
      emit(LoginErrorState('$e'));
    }
  }

  Future<void> logout() async {
    try {
      await service.logout();
      await persistentDataService.delete(loginIdKey);

      emit(const LoginLoggedOutState());
    } on Exception catch (e) {
      emit(LoginErrorState('$e'));
    }
  }

  Future<String> _getLoginId(String token) async {
    String? loginId = await persistentDataService.read<String?>(loginIdKey);

    if (loginId == null) {
      loginId = (await service.authorize(token)).loginId;

      await persistentDataService.write(loginIdKey, loginId);
    }

    return loginId;
  }
}
