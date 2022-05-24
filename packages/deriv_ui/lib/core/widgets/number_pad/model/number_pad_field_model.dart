
import 'package:deriv_ui/util/color.dart';
import 'package:flutter/material.dart';

/// Number pad field property
class NumberPadFieldModel {
  /// Constructor initialize
  const NumberPadFieldModel(
      {this.textStyle,
      this.labelStyle,
      this.borderSideColor = BrandColors.greenish,
      this.labelColor = LightThemeColors.base04,
      this.focusColor = BrandColors.greenish,
      this.withoutFocusColor = LightThemeColors.base04,
      this.textAlign = TextAlign.center});

  /// Show Label Style of input field
  final TextStyle? labelStyle;

  /// Input Text Style of input field
  final TextStyle? textStyle;

  /// Border side color of input field
  ///
  /// Default value is [BrandColors.greenish]
  final Color borderSideColor;

  /// Label color of input field
  ///
  /// Default value is [LightThemeColors.base04]
  final Color? labelColor;

  /// Focus color on input field
  ///
  /// Default value is [BrandColors.greenish]
  final Color? focusColor;

  /// Without focus color on input field
  ///
  /// Default value is [LightThemeColors.base04]
  final Color? withoutFocusColor;

  /// Text Align of input field
  ///
  /// Default value is [TextAlign.center]
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
        this.paddingFirstTitle = const EdgeInsets.only(
          left: 24,
          top: 24,
          bottom:24,
        ),
        this.paddingSecondTitle = const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 8,
        ),
      this.rightPaddingCurrency=24});

  ///  First text field property
  final NumberPadFieldModel? numberPadFieldModelFirst;

  /// Second text field property
  final NumberPadFieldModel? numberPadFieldModelSecond;

  /// First title value of first TextField.
  ///
  /// Default value is empty.
  final String? firstTitleValue;

  /// Second title value of second TextField.
  ///
  /// Default value is empty.
  final String? secondTitleValue;

  ///  TextStyle for Currency.
  final TextStyle? currencyTextStyle;

  /// Padding of first title TextField.
  ///
  /// Default value is
  ///    const EdgeInsets.only(
  ///           left: 24,
  ///           top: 24,
  ///           bottom:24,
  ///         )
  final EdgeInsetsGeometry? paddingFirstTitle;

  /// Padding of second title TextField.
  ///
  /// Default value is
  /// const EdgeInsets.symmetric(
  ///           vertical: 24,
  ///           horizontal: 8,
  ///         )
  final EdgeInsetsGeometry? paddingSecondTitle;

  /// Right padding for currency text.
  ///
  /// Default value is 24
  final double? rightPaddingCurrency;
}

/// Number pad single TextField model
class NumberPadSingleTextFieldModel {
  /// Initialize constructor
  const NumberPadSingleTextFieldModel(
      {this.style,
      this.numberPadFieldModel,
      this.label,
      this.margin,
      this.numberPadSingleTextHint,
      this.currencyLabelStyle,
      this.hint = '',
      this.backgroundColor = LightThemeColors.base07,
      this.verticalPadding = 16,
      this.singleTextTitleStyle,
      this.rightPadding = 16,
      this.iconSize = 24,
      this.iconColor = LightThemeColors.base04});

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

  /// Hint of single text title.This hint show when title is empty.
  final String? hint;

  /// Background color of title. This background color show when title is empty.
  ///
  /// Default value is [LightThemeColors.base07]
  final Color? backgroundColor;

  /// vertical padding of title. This padding show when title is empty.
  ///
  /// Default value is 16
  final double verticalPadding;

  /// TextStyle of title. This TextStyle show when title is empty.
  final TextStyle? singleTextTitleStyle;

  /// Right Padding of title. This right padding show when title is empty.
  ///
  /// Default value is 16
  final double rightPadding;

  /// Information icon size. This icon show when title is empty.
  ///
  ///  Default value is 24
  final double iconSize;

  /// Information icon color. This icon show when title is empty.
  ///
  /// Default value is [LightThemeColors.base04]
  final Color? iconColor;
}

/// Number message model
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
  ///
  /// Default value is [const TextStyle(color: BrandColors.coral)]
  final TextStyle? inValidTextStyle;

  /// TextStyle for valid message
  ///
  /// Default value is [const LightThemeColors.base04)]
  final TextStyle? validTextStyle;

  /// Padding of Number pad
  ///
  /// Default value is
  ///    EdgeInsets.only(
  ///        bottom: 8,
  ///        left: 16,
  ///        right: 16,
  ///      )}
  ///
  final EdgeInsetsGeometry? padding;
}
