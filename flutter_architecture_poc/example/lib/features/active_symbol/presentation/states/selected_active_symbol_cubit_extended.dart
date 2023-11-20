import 'package:example/features/active_symbol/presentation/states/selected_active_symbol_cubit.dart';
import 'package:example/features/login/presentation/states/login_cubit.dart';
import 'package:rxdart/rxdart.dart';

class SelectedActiveSymbolCubitExtended extends SelectedActiveSymbolCubit {
  SelectedActiveSymbolCubitExtended(this.loginStateStream) {
    _handleLogout();
  }

  final Stream<LoginState> loginStateStream;

  void _handleLogout() => loginStateStream
      .whereType<LoginLoggedOutState>()
      .listen((_) => updateActiveSymbol());
}
