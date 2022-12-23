import 'package:bloc/bloc.dart';
import 'package:deriv_auth/src/deriv_auth/IO/new_virtual_account_io.dart';

import '../../../../deriv_auth.dart';

part 'new_virtual_account_state.dart';

/// Class to handle creating a new virtual account.
class NewVirtualAccountCubit extends Cubit<NewVirtualAccountState>
    implements NewVirtualAccountIO {
  /// Initializes [NewVirtualAccountCubit] with initial state.
  NewVirtualAccountCubit({
    required this.service,
  }) : super(const NewVirtualAccountInitialState());

  /// Authentication Service
  final BaseNewVirtualAccountService service;

  /// Submit request for new virtual account.
  @override
  Future<void> openNewVirtualAccount({
    required NewVirtualAccountRequestModel newVirtualAccountModel,
  }) async {
    try {
      emit(const NewVirtualAccountProgressState());

      final AccountModel newAccount = await service.openNewVirtualAccount(
        newVirtualAccountModel: newVirtualAccountModel,
      );

      emit(NewVirtualAccountDoneState(newAccount));
    } on Exception catch (e) {
      emit(NewVirtualAccountErrorState(e.toString()));
    }
  }
}
