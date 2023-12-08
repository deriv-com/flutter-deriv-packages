import 'package:example/core/extensions/converters.dart';
import 'package:example/core/widgets/basic_chart/basic_chart.dart';
import 'package:example/features/chart/interactor/chart_service.dart';
import 'package:example/features/tick_history/interactor/base_tick_history_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chart_state.dart';

class ChartCubit extends Cubit<ChartState> {
  ChartCubit(this.service, this.tickHistoryService)
      : super(const ChartLoadingState());

  final ChartService service;
  final BaseTickHistoryService tickHistoryService;

  Future<void> initializeChart(String symbol, {int maxlength = 50}) async {
    try {
      emit(const ChartLoadingState());

      final List<BasicChartModel> tickHistory =
          (await tickHistoryService.fetchTickHistory(symbol, maxlength))
              .toBasicChartModel(symbol);

      emit(ChartLoadedState(tickHistory));
    } on Exception catch (e) {
      emit(ChartErrorState('$e'));
    }
  }

  Future<void> updateChart(BasicChartModel model, {int maxlength = 50}) async {
    try {
      if (state is ChartLoadingState) {
        return;
      }

      final List<BasicChartModel> tickHistory = service.adjustData(
        List<BasicChartModel>.from((state as ChartLoadedState).data),
        maxlength,
      )..add(model);

      emit(ChartLoadedState(tickHistory));
    } on Exception catch (e) {
      emit(ChartErrorState('$e'));
    }
  }
}
