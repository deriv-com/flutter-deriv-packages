part of 'chart_cubit.dart';

abstract class ChartState {
  const ChartState();
}

class ChartLoadingState extends ChartState {
  const ChartLoadingState();
}

class ChartLoadedState extends ChartState {
  const ChartLoadedState([
    this.data = const <BasicChartModel>[],
  ]);

  final List<BasicChartModel> data;
}

class ChartErrorState extends ChartState {
  ChartErrorState(this.message);

  final String message;
}
