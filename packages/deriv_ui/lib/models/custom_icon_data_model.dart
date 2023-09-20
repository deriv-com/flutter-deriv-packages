/// This class holds custom image/icon details. It is usually used when passing
/// an icon to FullscreenMessage page.
class CustomIconData {
  /// It takes [icon] path from assets, and its desired [width] and [height].
  CustomIconData({
    required this.icon,
    this.width,
    this.height,
  });

  /// The string path of the icon.
  final String icon;

  /// The width.
  final double? width;

  /// The height.
  final double? height;
}
