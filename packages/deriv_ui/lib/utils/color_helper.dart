import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

/// Gets opacity based on enable state.
double getOpacity({required bool isEnabled}) => isEnabled ? 1.0 : 0.32;

/// Gets text color based on value sign.
Color getTextColorByNumberSign({
  required BuildContext context,
  required num value,
}) =>
    value.isNegative
        ? context.theme.colors.danger
        : context.theme.colors.success;

/// Linearly interpolate between two colors.
/// Can be used in the situations where opacity can't be applied.
Color getLerpColor({
  required Color enabledColor,
  required bool isEnabled,
}) =>
    Color.lerp(Colors.black, enabledColor, getOpacity(isEnabled: isEnabled))!;
