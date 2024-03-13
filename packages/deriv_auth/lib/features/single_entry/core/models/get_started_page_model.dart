import 'package:deriv_auth/deriv_auth.dart';

/// Get Started Page Model
class GetStartedPageModel {
  /// Constructor [GetStartedPageModel]
  const GetStartedPageModel({
    required this.slides,
    required this.appLogoIconPath,
    required this.backgroundImagePath,
  });

  /// List of Deriv Get Started page Slides
  final List<DerivGetStartedSlideModel> slides;

  /// Logo icon path
  final String appLogoIconPath;

  /// Background image path
  final String backgroundImagePath;
}
