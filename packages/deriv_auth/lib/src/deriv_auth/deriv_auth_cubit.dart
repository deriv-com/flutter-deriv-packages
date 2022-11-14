import 'package:bloc/bloc.dart';
import 'package:deriv_auth/src/core/api_client/exceptions/http_exceptions.dart';
import 'package:deriv_auth/src/deriv_auth/deriv_auth_exception.dart';
import 'package:deriv_auth/src/deriv_auth/deriv_auth_io.dart';
import 'package:deriv_auth/src/deriv_auth/deriv_auth_service.dart';
import 'package:deriv_auth/src/deriv_auth/deriv_auth_state.dart';
import 'package:deriv_auth/src/models/account/account.dart';
import 'package:deriv_auth/src/models/login/enums.dart';
import 'package:deriv_auth/src/models/login/login_request.dart';

class DerivAuthCubit extends Cubit<DerivAuthState> implements DerivAuthIO {
  //TODO(mohammad): loading state at inital?
  DerivAuthCubit({required this.authService}) : super(DerivAuthLoadingState());

  final AuthService authService;

  @override
  Future<void> systemLogin({
    required String email,
    required String password,
  }) async {
    final LoginRequestModel request = LoginRequestModel(
      type: LoginType.system,
      email: email,
      password: password,
    );

    try {
      final List<AccountModel> accounts =
          await authService.fetchAccounts(request: request);

      if (accounts.isNotEmpty) {
        authorizeAccounts(accounts: accounts);
      }
    } on DerivAuthException catch (error) {
      emit(DerivAuthErrorState(message: error.message));
    }
  }

  @override
  Future<void> otpLogin(
      {required String email, required String password, required String otp}) {
    throw UnimplementedError();
  }

  @override
  Future<void> socialLogin({required String oneAllConnectionToken}) {
    throw UnimplementedError();
  }

  @override
  Future<void> authorizeAccounts({required List<AccountModel> accounts}) async {
    final List<AccountModel> supportedAccounts =
        authService.filterSupportedAccounts(accounts);

    if (supportedAccounts.isNotEmpty) {
      //TODO(mohammad): do we need to have logic for selecting default account?
      final AccountModel defaultAccount = supportedAccounts.first;

      authService.authorizeSingleAccount(account: defaultAccount);
    } else {
      //TODO():
      //logger.log('$DerivAuthCubit: The account is not supported.');

      emit(
        DerivAuthErrorState(
          message: 'This service is not available in your country.',
        ),
      );
    }
  }

  @override
  Future<void> authorizeDefaultAccount() {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }

  @override
  Stream<DerivAuthState> get output => stream;
}
