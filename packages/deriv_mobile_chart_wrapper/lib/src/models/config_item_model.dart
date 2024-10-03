import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';

class ConfigItemModel {
  final List<IndicatorConfig> indicatorConfigs;

  final List<DrawingToolConfig> drawingToolConfigs;

  ConfigItemModel({
    required this.indicatorConfigs,
    required this.drawingToolConfigs,
  });
}
