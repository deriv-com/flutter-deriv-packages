import 'package:bloc/bloc.dart';

import '../../../../deriv_auth.dart';

part 'new_virtual_account_state.dart';

/// Cubit to handle new virtual account signup process.
///
class NewVirtualAccountCubit extends Cubit<NewVirtualAccountState> {
  /// Initializes the cubit with an initial state of `NewVirtualAccountInitialState`.
  ///
  NewVirtualAccountCubit({
    required this.authService,
  }) : super(const NewVirtualAccountInitialState());

  /// Authentication Service
  ///
  final BaseAuthService authService;

  /// Submit request for new virtual account.
  ///
  Future<void> submitRequest({
    required NewVirtualAccountRequestModel newVirtualAccountModel,
  }) async {
    try {
      emit(const NewVirtualAccountProgressState());

      final AccountModel newAccount =
          await authService.submitNewVirtualAccountRequest(
        newVirtualAccountModel: newVirtualAccountModel,
      );

      emit(NewVirtualAccountDoneState(newAccount));
    } on Exception catch (e) {
      emit(NewVirtualAccountErrorState(e.toString()));
    }
  }
}
