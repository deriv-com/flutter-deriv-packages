/// Model class to keep the information of an indicator item.
class IndicatorItemModel {
  /// Initializes an indicator item model.
  const IndicatorItemModel({
    required this.title,
    required this.icon,
  });

  /// The title.
  final String title;

  /// The path to the SVG icon.
  final String icon;
}
