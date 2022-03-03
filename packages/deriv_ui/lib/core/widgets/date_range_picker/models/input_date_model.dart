import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

/// Input date range model
class InputDateRangeModel{

  /// initialize construct
  InputDateRangeModel({
    this.selectedDateRangeColor = LightThemeColors.base02,
    this.selectedDateRangeTextStyle = const TextStyle(),
    this.backgroundColor = LightThemeColors.base02,
    this.titleColor = LightThemeColors.base02,
    this.titlePadding = const EdgeInsets.only(
      top: 16,
      left: 24,
      right: 16,
      bottom: 16,
    ),
    this.titleStyle = const TextStyle(color: Colors.black),
    this.verticalPadding = 8,
    this.dateInputPadding = const EdgeInsets.only(
      left: 24,
      top: 16,
      right: 24,
    ),
    this.dateRangeIconColor = LightThemeColors.base08,
    this.cancelButtonStyle,
    this.okButtonStyle,
    this.okButtonValidColor = BrandColors.coral,
    this.okButtonNotValidColor = LightThemeColors.base05,

    this.labelTextSelectedRange,
    this.dateRangeLabel,
    this.dateRangeTooltip,
    this.cancelButtonText,
    this.okButtonText,
    this.labelTextSelectedStartDate,
    this.labelTextSelectedEndDate});

  ///Background Color
  final Color? backgroundColor;

  /// Title color
  final Color? titleColor;

  /// Title padding
  final EdgeInsetsGeometry? titlePadding;

  /// Title Style
  final TextStyle? titleStyle;

  /// Title vertical padding
  final double? verticalPadding;

  /// Date Input padding
  final EdgeInsetsGeometry? dateInputPadding;

  /// Calender button Color
  final Color? dateRangeIconColor;

  /// Cancel Button Style
  final TextStyle? cancelButtonStyle;

  /// Ok Button Style
  final TextStyle? okButtonStyle;

  /// Ok Button valid Color
  final Color? okButtonValidColor;

  /// Ok Button not valid color
  final Color? okButtonNotValidColor;

  ///
  final TextStyle selectedDateRangeTextStyle;

  ///
  final Color selectedDateRangeColor;

  ///  Select date range label text
  final String? labelTextSelectedRange;

  /// Select date range label
  final String? dateRangeLabel;

  /// Select date range tooltip
  final String? dateRangeTooltip;

  /// Cancel button text
  final String? cancelButtonText;

  /// Cancel button text
  final String? okButtonText;

  /// Start date Label Text
  final String? labelTextSelectedStartDate;

  /// End date Label Text
  final String? labelTextSelectedEndDate;


}