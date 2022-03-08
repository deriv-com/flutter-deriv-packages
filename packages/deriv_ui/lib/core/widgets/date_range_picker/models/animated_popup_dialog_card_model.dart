import 'dart:ui';

import '../../../../util/color.dart';

/// Selected date range edita animate popup dialog card model.
class AnimatedPopupDialogCardModel{

  /// Constructor initializing.
  const AnimatedPopupDialogCardModel({ this.cardPadding=2,
    this.cardBorderRadius=4,
    this.cardElevation=4,
    this.cardColor=LightThemeColors.base08,
    this.verticalMargin=8});

  /// Vertical margin Container in edit dialog.
  final double? verticalMargin;

  /// Card Elevation value in edit dialog.
  final double? cardElevation;

  /// Card color in edit dialog.
  final Color? cardColor;

  /// Card border radius in edit dialog.
  final double? cardBorderRadius;

  /// Card padding in edit dialog.
  final double? cardPadding;


}