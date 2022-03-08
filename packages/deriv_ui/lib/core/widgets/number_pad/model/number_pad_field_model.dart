import 'dart:ui';

import 'package:deriv_ui/util/color.dart';
import 'package:flutter/material.dart';

/// Number pad field property
class NumberPadFieldModel {
  /// Constructor initialize
  const NumberPadFieldModel(
      {this.textStyle,
      this.labelStyle,
      this.borderSideColor = BrandColors.coral,
      this.labelColor = LightThemeColors.base04,
      this.focusColor = BrandColors.greenish,
      this.withoutFocusColor = LightThemeColors.base04,
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

/// Number pad double TextFiled  model
class NumberPadDoubleTextFieldModel {

  /// Initialize constructor
  const NumberPadDoubleTextFieldModel(
      {this.numberPadFieldModelFirst = const NumberPadFieldModel(),
      this.numberPadFieldModelSecond = const NumberPadFieldModel(),
      this.firstTitleValue = '',
      this.secondTitleValue = '',
      this.currencyTextStyle,
      this.paddingFirstTitle,
      this.paddingSecondTitle});

  ///  First text filed property
  final NumberPadFieldModel? numberPadFieldModelFirst;

  /// Second text filed property
  final NumberPadFieldModel? numberPadFieldModelSecond;

  /// First title value
  final String? firstTitleValue;

  /// Second title value
  final String? secondTitleValue;

  /// Currency Text style
  final TextStyle? currencyTextStyle;

  /// Padding of first title
  final EdgeInsetsGeometry? paddingFirstTitle;

  /// Padding of second title
  final EdgeInsetsGeometry? paddingSecondTitle;
}

/// Number pad single TextField model
class NumberPadSingleTextFieldModel {

  /// Initialize constructor
  const NumberPadSingleTextFieldModel({this.style,
      this.numberPadFieldModel,
      this.label,
      this.margin,
      this.numberPadSingleTextHint,
      this.currencyLabelStyle});

  /// Text Style of TextField.
  final TextStyle? style;

  /// Single text field property.
  final NumberPadFieldModel? numberPadFieldModel;

  /// Label value of TextFiled.
  final String? label;

  /// Hint of single TextField of NumberPad.
  final String? numberPadSingleTextHint;

  /// Margin value of TextField.
  final double? margin;

  /// Currency label text style
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

  /// Padding of Number pad
  final EdgeInsetsGeometry? padding;
}
