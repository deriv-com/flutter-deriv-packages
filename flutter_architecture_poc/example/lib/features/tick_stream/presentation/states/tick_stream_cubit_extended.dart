import 'package:example/core/enums.dart';
import 'package:example/features/active_symbol/presentation/states/selected_active_symbol_cubit.dart';
import 'package:example/features/tick_stream/presentation/states/tick_stream_cubit.dart';
import 'package:rxdart/rxdart.dart';

class TickStreamCubitExtended extends TickSteamCubit {
  TickStreamCubitExtended(
    super.service,
    this.connectivityStream,
    this.selectedSymbolStream,
  ) {
    _handleConnectivty();
    _handleSelectedSymbol();
  }

  final Stream<ConnectivityStatus> connectivityStream;
  final Stream<SelectedActiveSymbolState> selectedSymbolStream;

  void _onSelectedSymbolChanged({String? activeSymbol}) =>
      fetchTickStream(activeSymbol);

  void _handleConnectivty() => connectivityStream.listen(
        (ConnectivityStatus connectivityStatus) {
          final bool reloadTickStream =
              connectivityStatus == ConnectivityStatus.connected &&
                  state is TickStreamLoadedState;

          if (reloadTickStream) {
            _onSelectedSymbolChanged(
              activeSymbol: (state as TickStreamLoadedState).tick.symbol,
            );
          }
        },
      );

  void _handleSelectedSymbol() => selectedSymbolStream
      .whereType<SelectedActiveSymbolUpdateState>()
      .listen(
        (SelectedActiveSymbolState state) =>
            _onSelectedSymbolChanged(activeSymbol: state.activeSymbol?.symbol),
      );
}
