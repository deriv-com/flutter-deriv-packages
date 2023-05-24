class NumberPadLabel {
  NumberPadLabel({
    required this.semanticNumberPadBottomSheetHandle,
    required this.warnValueCantBeLessThan,
    required this.warnValueCantBeGreaterThan,
    required this.warnDoubleInputValueCantBeLessThan,
    required this.warnDoubleInputValueCantBeGreaterThan,
    required this.warnValueShouldBeInRange,
    required this.actionOK,
  });

  final String semanticNumberPadBottomSheetHandle;

  final String actionOK;

  final String Function(
    Object Input,
    Object minAmount,
    Object currencySymbol,
  ) warnValueCantBeLessThan;

  final String Function(
    Object Input,
    Object maxAmount,
    Object currencySymbol,
  ) warnValueCantBeGreaterThan;

  final String Function(
    Object Input,
    Object minAmount,
    Object currencySymbol,
  ) warnDoubleInputValueCantBeLessThan;

  final String Function(
    Object Input,
    Object maxAmount,
    Object currencySymbol,
  ) warnDoubleInputValueCantBeGreaterThan;

  final String Function(
    Object Input,
    Object minAmountClear,
    Object currencySymbol,
    Object maxAmount,
  ) warnValueShouldBeInRange;
}
