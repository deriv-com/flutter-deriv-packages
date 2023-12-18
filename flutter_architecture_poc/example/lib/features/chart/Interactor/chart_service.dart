import 'package:example/core/widgets/basic_chart/basic_chart.dart';
import 'package:example/features/chart/interactor/base_chart_service.dart';

class ChartService implements BaseChartService {
  const ChartService();

  List<BasicChartModel> adjustData(List<BasicChartModel> data, int maxlength) =>
      data.length > maxlength ? data.sublist(data.length - maxlength) : data;
}
