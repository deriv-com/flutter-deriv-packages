import 'dart:ui';

import 'package:flutter/material.dart';

/// Number pad field property
class NumberPadFieldModel {
  /// Constructor initialize
  NumberPadFieldModel(
      {required this.textStyle,
      this.labelStyle,
      this.borderSideColor = Colors.black,
      this.labelColor,
      this.focusColor,
      this.withoutFocusColor,
      this.textAlign = TextAlign.start});

  /// Show Label Style
  final TextStyle? labelStyle;

  /// Input Text Style
  final TextStyle textStyle;

  /// Border side color
  final Color borderSideColor;

  ///Label color
  final Color? labelColor;

  /// Focus color on input field
  final Color? focusColor;

  /// Without focus color on input field
  final Color? withoutFocusColor;

  /// Text Align
  final TextAlign textAlign;
}

///
class NumberPadDoubleTextFieldModel {
  ///
  NumberPadDoubleTextFieldModel(
      {this.numberPadFieldModelFirst,
      this.numberPadFieldModelSecond,
      this.firstTitleValue,
      this.secondTitleValue,
      this.currencyTextStyle,
      this.paddingFirstTitle,
      this.paddingSecondTitle});

  ///
  final NumberPadFieldModel? numberPadFieldModelFirst;

  ///
  final NumberPadFieldModel? numberPadFieldModelSecond;

  final String? firstTitleValue;
  final String? secondTitleValue;
  final TextStyle? currencyTextStyle;
  final EdgeInsetsGeometry? paddingFirstTitle;
  final EdgeInsetsGeometry? paddingSecondTitle;
}

///
class NumberPadSingleTextFieldModel {
  ///
  NumberPadSingleTextFieldModel(
      {
      this.style,
      this.numberPadFieldModel,
      this.label,
      this.margin,
      this.currencyLabelStyle});

  final TextStyle? style;
  final NumberPadFieldModel? numberPadFieldModel;
  final String? label;
  final double? margin;
  final TextStyle? currencyLabelStyle;
}

///Number message model
class NumberPadMessageModel {

  /// Constructor initialize
  NumberPadMessageModel(
      {this.inValidTextStyle, this.validTextStyle, this.padding});

  /// TextStyle for inValid message
  final TextStyle? inValidTextStyle;

  /// TextStyle for valid message
  final TextStyle? validTextStyle;

  ///Padding
  final EdgeInsetsGeometry? padding;
}
