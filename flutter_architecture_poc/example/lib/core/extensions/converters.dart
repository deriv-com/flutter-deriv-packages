import 'package:dart_web_socket_handler/web_socket_handler.dart';
import 'package:example/core/enums.dart';
import 'package:example/core/widgets/basic_chart/basic_chart.dart';
import 'package:example/features/tick_history/domain/tick_history_entity.dart';

extension TickHistoryExtension on TickHistoryEntity {
  List<BasicChartModel> toBasicChartModel(String symbol) {
    final List<BasicChartModel> models = <BasicChartModel>[];

    for (int i = 0; i < times.length; i++) {
      models.add(
        BasicChartModel(
          symbol: symbol,
          epoch: times[i],
          quote: prices[i],
          pipSize: pipSize,
        ),
      );
    }

    return models;
  }
}

extension ConnectivityStatusExtension on ConnectionState {
  ConnectivityStatus get connectivityStatus => this is ConnectingState ||
          this is ReconnectingState ||
          this is DisconnectingState ||
          this is DisconnectedState
      ? ConnectivityStatus.connecting
      : ConnectivityStatus.connected;
}
