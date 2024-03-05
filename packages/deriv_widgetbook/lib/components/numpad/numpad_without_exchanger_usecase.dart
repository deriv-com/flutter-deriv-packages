import 'package:flutter/material.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:intl/intl.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Without Currency Exchanger',
  type: NumberPad,
)
Widget numpadUseCase(BuildContext context) => Align(
      alignment: Alignment.bottomCenter,
      child: NumberPad(
        numberPadType: NumberPadWidgetType.singleInput,
        currency: 'USD',
        firstInputTitle: 'Amount',
        formatter: NumberFormat.decimalPattern(),
        firstInputInitialValue: 20,
        firstInputMaximumValue: 100,
        firstInputMinimumValue: 10,
        label: NumberPadLabel(
          semanticNumberPadBottomSheetHandle:
              'semanticNumberPadBottomSheetHandle',
          warnValueCantBeLessThan:
              (Object input, Object minValue, Object currency) =>
                  '$input can\'t be less than $minValue $currency',
          warnValueCantBeGreaterThan:
              (Object input, Object maxValue, Object currency) =>
                  '$input can\'t be greater than $maxValue $currency',
          warnDoubleInputValueCantBeLessThan: (Object input, Object minValue,
                  Object currency) =>
              'Invalid $input. $input can\'t be less than $minValue $currency',
          warnDoubleInputValueCantBeGreaterThan: (Object input, Object maxValue,
                  Object currency) =>
              'Invalid $input. $input can\'t be greater than $maxValue $currency',
          warnValueShouldBeInRange: (Object input, Object minValue,
                  Object currency, Object maxValue) =>
              '$input between $minValue $currency and $maxValue $currency',
          actionOK: 'OK',
        ),
      ),
    );
