/// Model for the slides in the get started page
class DerivGetStartedSlideModel {
  /// Initializes [DerivGetStartedSlideModel].
  DerivGetStartedSlideModel({
    required this.imagePath,
    required this.supportingText,
  });

  /// Path to the image.
  final String imagePath;

  /// Supporting text.
  final String supportingText;
}
