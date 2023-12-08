import 'package:example/core/connectivity_service/connectivity_service.dart';
import 'package:example/core/widgets/basic_chart/basic_chart.dart';
import 'package:example/features/chart/interactor/chart_service.dart';
import 'package:example/features/chart/presentation/states/chart_cubit.dart';
import 'package:example/features/chart/presentation/states/chart_cubit_extended.dart';
import 'package:example/features/tick_history/interactor/tick_history_service.dart';
import 'package:example/features/tick_history/data/tick_history_data_source.dart';
import 'package:example/features/tick_history/data/tick_history_mapper.dart';
import 'package:example/features/tick_history/data/tick_history_repository.dart';
import 'package:example/features/tick_stream/presentation/states/tick_stream_cubit_extended.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(elevation: 0, title: const Text('Chart')),
        body: BlocBuilder<ChartCubitExtended, ChartState>(
          bloc: _getChartBloc(context),
          builder: (BuildContext context, ChartState state) {
            if (state is ChartLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ChartLoadedState) {
              return _buildBasicChart(context, state.data);
            }

            if (state is ChartErrorState) {
              return Text(state.message);
            }

            return const Text('Unknown State.');
          },
        ),
      );

  ChartCubitExtended _getChartBloc(BuildContext context) => ChartCubitExtended(
        const ChartService(),
        TickHistoryService(
          TickHistoryRepoistory(TickHistoryDataSource(TickHistoryMapper())),
        ),
        ConnectivityService().connectivityStatus,
        context.read<TickStreamCubitExtended>().stream,
      );

  Widget _buildBasicChart(BuildContext context, List<BasicChartModel> data) =>
      Padding(
        padding: const EdgeInsets.only(top: 64, left: 32, right: 32),
        child: BasicChart(
          data: data,
          size: Size(MediaQuery.of(context).size.width * 0.8, 300),
        ),
      );
}
