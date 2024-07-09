import '../enums.dart';

/// Model class to keep the information of an indicator item.
class IndicatorItemModel {
  /// Initializes an indicator item model.
  const IndicatorItemModel({
    required this.category,
    required this.title,
    required this.icon,
  });

  /// The title.
  final String title;

  /// The path to the SVG icon.
  final String icon;

  /// The category of indicator i.e., momentum, volatility, moving averages.
  final IndicatorCategory category;
}
