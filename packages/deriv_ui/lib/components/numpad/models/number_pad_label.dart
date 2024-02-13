import 'numpad_validation_text.dart';

/// A class that will hold all the strings required by the NumberPad widget.
class NumberPadLabel {
  /// Initialize [NumberPadLabel].
  NumberPadLabel({
    required this.actionOK,
    this.semanticNumberPadBottomSheetHandle,
    this.warnValueCantBeLessThan,
    this.warnValueCantBeGreaterThan,
    this.warnDoubleInputValueCantBeLessThan,
    this.warnDoubleInputValueCantBeGreaterThan,
    this.warnValueShouldBeInRange,
    this.onValidate,
  });

  /// Semantic label for the handle svg at the top of the NumberPad bottom sheet.
  final String? semanticNumberPadBottomSheetHandle;

  /// The text on the 'OK' button that's in the AlertDialgue.
  final String actionOK;

  /// `{Input} can't be less than {minAmount} {currencySymbol}`
  final String Function(
    Object input,
    Object minAmount,
    Object currencySymbol,
  )? warnValueCantBeLessThan;

  /// `{Input} can't be greater than {maxAmount} {currencySymbol}`
  final String Function(
    Object input,
    Object maxAmount,
    Object currencySymbol,
  )? warnValueCantBeGreaterThan;

  /// `Invalid {Input}. {Input} can't be less than {minAmount} {currencySymbol}`
  final String Function(
    Object input,
    Object minAmount,
    Object currencySymbol,
  )? warnDoubleInputValueCantBeLessThan;

  /// `Invalid {Input}. {Input} can't be greater than {maxAmount} {currencySymbol}`
  final String Function(
    Object input,
    Object maxAmount,
    Object currencySymbol,
  )? warnDoubleInputValueCantBeGreaterThan;

  /// `{Input} between {minAmountClear} {currencySymbol} and {maxAmount} {currencySymbol}`
  final String Function(
    Object input,
    Object minAmountClear,
    Object currencySymbol,
    Object maxAmount,
  )? warnValueShouldBeInRange;

  /// With this, client code can have their own validation logic.
  /// Returning [NumpadValidationText] means this will show the message 
  /// in the UI Returning [null] means it won't show the message in the UI.
  final NumpadValidationText? Function(String)? onValidate;
}
