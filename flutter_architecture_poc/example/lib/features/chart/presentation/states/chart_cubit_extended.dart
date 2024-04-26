import 'package:example/core/enums.dart';
import 'package:example/core/widgets/basic_chart/basic_chart.dart';
import 'package:example/features/chart/presentation/states/chart_cubit.dart';
import 'package:example/features/tick_stream/presentation/states/tick_stream_cubit.dart';
import 'package:rxdart/rxdart.dart';

class ChartCubitExtended extends ChartCubit {
  ChartCubitExtended(
    super.service,
    super.tickHistoryService,
    this.connectivityStream,
    this.symbolStream,
  ) {
    _handleConnectivty();
    _handleActiveSymbolStream();
  }

  final Stream<ConnectivityStatus> connectivityStream;
  final Stream<TickStreamState> symbolStream;

  void _handleConnectivty() => connectivityStream
          .where((ConnectivityStatus status) =>
              status == ConnectivityStatus.connected)
          .listen(
        (_) async {
          final TickStreamLoadedState tickState =
              await symbolStream.whereType<TickStreamLoadedState>().first;

          await initializeChart(tickState.tick.symbol);
        },
      );

  void _handleActiveSymbolStream() => symbolStream
      .whereType<TickStreamLoadedState>()
      .listen(_onTickStreamUpdate);

  void _onTickStreamUpdate(TickStreamLoadedState state) => updateChart(
        BasicChartModel(
          symbol: state.tick.symbol,
          epoch: state.tick.epoch,
          quote: state.tick.quote,
          pipSize: state.tick.pipSize,
        ),
      );
}
