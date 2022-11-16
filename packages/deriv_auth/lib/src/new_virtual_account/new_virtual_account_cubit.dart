import 'package:bloc/bloc.dart';

import 'package:deriv_auth/src/new_virtual_account/new_virtual_account_model.dart';
import 'package:deriv_auth/src/new_virtual_account/new_virtual_account_repository.dart';
import 'package:deriv_auth/src/new_virtual_account/new_virtual_account_request_model.dart';

part 'new_virtual_account_state.dart';

/// Cubit to handle new virtual account signup process.
class NewVirtualAccountCubit extends Cubit<NewVirtualAccountState> {
  /// Initializes the cubit with an initial state of `NewVirtualAccountInitialState`.
  NewVirtualAccountCubit({required this.repository})
      : super(const NewVirtualAccountInitialState());

  final BaseNewVirtualAccountRepository repository;

  /// Submit request for new virtual account.
  void submitRequest({
    required NewVirtualAccountRequestModel request,
  }) {
    emit(const NewVirtualAccountProgressState());

    repository
        .openNewVirtualAccount(request)
        .then((response) => emit(NewVirtualAccountDoneState(response)))
        .onError(
          (error, stackTrace) =>
              emit(NewVirtualAccountErrorState(error.toString())),
        );
  }
}
