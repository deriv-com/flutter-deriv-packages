import 'dart:ui';

import 'package:deriv_ui/util/color.dart';
import 'package:flutter/material.dart';

/// Number pad field property
class NumberPadFieldModel {
  /// Constructor initialize
const  NumberPadFieldModel(
      { this.textStyle,
      this.labelStyle,
      this.borderSideColor = BrandColors.coral,
      this.labelColor=LightThemeColors.base04,
      this.focusColor=BrandColors.greenish,
      this.withoutFocusColor=LightThemeColors.base04,
      this.textAlign = TextAlign.start});

  /// Show Label Style
  final TextStyle? labelStyle;

  /// Input Text Style
  final TextStyle? textStyle;

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
  const NumberPadDoubleTextFieldModel(
      {this.numberPadFieldModelFirst=const NumberPadFieldModel(),
      this.numberPadFieldModelSecond=const NumberPadFieldModel(),
      this.firstTitleValue='',
      this.secondTitleValue='',
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
  const NumberPadSingleTextFieldModel(
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
  const NumberPadMessageModel(
      {this.validTextStyle = const TextStyle(color: LightThemeColors.base04),
        this.inValidTextStyle = const TextStyle(color: BrandColors.coral),
        this.padding = const EdgeInsets.only(
          bottom: 8,
          left: 16,
          right: 16,
        )});

  /// TextStyle for inValid message
  final TextStyle? inValidTextStyle;

  /// TextStyle for valid message
  final TextStyle? validTextStyle;

  ///Padding
  final EdgeInsetsGeometry? padding;
}
