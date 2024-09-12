import 'package:deriv_chart/deriv_chart.dart';

/// Model class to keep the information of an drawing tool item.
class DrawingToolItemModel {
  /// Initializes a drawing tool item model.
  const DrawingToolItemModel({
    required this.title,
    required this.icon,
    required this.config,
  });

  /// The title.
  final String title;

  /// The path to the SVG icon.
  final String icon;

  /// The [config] property holds the drawing tool configuration.
  final DrawingToolConfig config;
}
