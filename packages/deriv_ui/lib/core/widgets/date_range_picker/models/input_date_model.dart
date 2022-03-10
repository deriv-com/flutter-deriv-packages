import 'package:flutter/material.dart';

import '../../../../util/color.dart';

/// A data class to represent information after parsing a string to date.
class InputDateModel {
  /// Constructor initializing.
  InputDateModel({
    this.isValidOrNull = true,
    this.dateTime,
  });

  /// Flag to represent whether the input string is in valid format or null.
  ///
  /// Default to `true`.
  bool isValidOrNull;

  /// Valid DateTime generated from the string.
  DateTime? dateTime;
}

/// Properties of the  selected date range edit dialog.
class InputDateRangeModel{

  /// initialize constructor
  const InputDateRangeModel({
    this.selectedDateRangeColor = LightThemeColors.base02,
    this.selectedDateRangeTextStyle = const TextStyle(),
    this.backgroundColor = LightThemeColors.base08,
    this.titleColor = LightThemeColors.base07,
    this.titlePadding = const EdgeInsets.only(
      top: 16,
      left: 24,
      right: 16,
      bottom: 16,
    ),
    this.titleStyle = const TextStyle(color: LightThemeColors.base03),
    this.verticalPadding = 8,
    this.dateInputPadding = const EdgeInsets.only(
      left: 24,
      top: 16,
      right: 24,
    ),
    this.dateRangeIconColor = LightThemeColors.base02,
    this.cancelButtonStyle=const TextStyle(color: BrandColors.coral),
    this.okButtonStyle=const TextStyle(color: BrandColors.coral),
    this.okButtonValidColor = BrandColors.coral,
    this.okButtonNotValidColor = LightThemeColors.base05,

    this.labelTextSelectedRange,
    this.dateRangeLabel,
    this.dateRangeTooltip,
    this.cancelButtonText,
    this.okButtonText,
    this.labelTextSelectedStartDate,
    this.labelTextSelectedEndDate});

  /// Background Color of edit dialog.
  final Color? backgroundColor;

  /// Title color of edit dialog.
  final Color? titleColor;

  /// Title padding of edit dialog.
  final EdgeInsetsGeometry? titlePadding;

  /// Title Style of edit dialog.
  final TextStyle? titleStyle;

  /// Title vertical padding of edit dialog.
  final double? verticalPadding;

  /// Date Input padding of edit dialog.
  final EdgeInsetsGeometry? dateInputPadding;

  /// Calender icon Color of edit dialog.
  final Color? dateRangeIconColor;

  /// Cancel Button Style of edit dialog.
  final TextStyle? cancelButtonStyle;

  /// Ok Button Style of edit dialog.
  final TextStyle? okButtonStyle;

  /// Ok Button valid Color of edit dialog.
  final Color? okButtonValidColor;

  /// Ok Button not valid color of edit dialog.
  final Color? okButtonNotValidColor;

  /// Selected date range text of [TextStyle] in edit dialog.
  final TextStyle selectedDateRangeTextStyle;

  /// Selected date range text of [Color] in edit dialog.
  final Color selectedDateRangeColor;

  ///  Select date range label text of edit dialog.
  final String? labelTextSelectedRange;

  /// Select date range label of edit dialog.
  final String? dateRangeLabel;

  /// Select date range tooltip of edit dialog.
  final String? dateRangeTooltip;

  /// Cancel button text of edit dialog.
  final String? cancelButtonText;

  /// Ok button text of edit dialog.
  final String? okButtonText;

  /// Start date Label Text of edit dialog.
  final String? labelTextSelectedStartDate;

  /// End date Label Text of edit dialog.
  final String? labelTextSelectedEndDate;


}