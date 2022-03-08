
import 'package:flutter/material.dart';

import '../../../../util/color.dart';


/// Date Range TextField
class DateRangeTextFieldModel {
  /// Constructor initialize
  DateRangeTextFieldModel(
      {this.dateFormat,
      this.width,
      this.cursorColor=BrandColors.greenish,
      this.style,
      this.hintStyle,
      this.labelStyle,
      this.inputBorderValidColor,
      this.inputBorderNotValidColor,
      this.outlineBorderValidColor,
      this.outlineBorderNotValidColor,
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
