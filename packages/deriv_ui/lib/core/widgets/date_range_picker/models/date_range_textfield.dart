
import 'package:flutter/material.dart';

import '../../../../util/color.dart';


/// Date Range TextField
class DateRangeTextFieldModel {
  /// Constructor initialize
  const DateRangeTextFieldModel(
      {this.dateFormat='dd-MM-yyyy',
      this.width=8,
      this.cursorColor=BrandColors.greenish,
      this.style=const TextStyle(color: LightThemeColors.base03),
      this.hintStyle=const TextStyle(color: LightThemeColors.base04),
      this.labelStyle=const TextStyle(color: BrandColors.greenish),
      this.inputBorderValidColor=LightThemeColors.base06,
      this.inputBorderNotValidColor=BrandColors.coral,
      this.outlineBorderValidColor=BrandColors.greenish,
      this.outlineBorderNotValidColor=BrandColors.coral,
      this.labelTextStartDate,
      this.labelTextEndDate});

  /// The accepted Date format for the TextField
  final String? dateFormat;

  /// Margin for TextField
  final double? width;

  /// TextField Cursor color
  final Color? cursorColor;

  /// TextField TextStyle
  final TextStyle? style;

  /// TextField hintStyle
  final TextStyle? hintStyle;

  /// TextField labelStyle
  final TextStyle? labelStyle;

  /// TextField input decoration border valid color
  final Color? inputBorderValidColor;

  /// TextField input decoration border not valid color
  final Color? inputBorderNotValidColor;

  /// TextField outline decoration border valid color
  final Color? outlineBorderValidColor;

  /// TextField outline decoration border not valid color
  final Color? outlineBorderNotValidColor;

  /// Label text of start date for TextField
  final String? labelTextStartDate;

  /// Label text of end date for TextField
  final String? labelTextEndDate;
}
