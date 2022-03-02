import 'dart:ui';

import '../../../../util/color.dart';

///
class AnimatedPopupDialogCardModel{

  /// Constructor initializing.
  const AnimatedPopupDialogCardModel({ this.cardPadding=2,
    this.cardBorderRadius=4,
    this.cardElevation=4,
    this.cardColor=LightThemeColors.base08,
    this.verticalMargin=8});

  ///Container vertical margin
  final double? verticalMargin;

  ///Card Elevation value
  final double? cardElevation;

  ///Card color
  final Color? cardColor;

  ///Card border radius
  final double? cardBorderRadius;

  ///Card padding
  final double? cardPadding;



}