part of 'number_pad.dart';

class _NumberPadProvider extends InheritedWidget {
  const _NumberPadProvider({
    required Widget child,
    required this.type,
    required this.currency,
    required this.formatter,
    required this.focusedInput,
    required this.firstInputFocusNode,
    required this.isFirstInputInRange,
    required this.isSecondInputInRange,
    required this.isAllInputsValid,
    required this.firstInputMaximumValue,
    required this.secondInputMinimumValue,
    required this.label,
    this.secondInputMaximumValue,
    this.firstInputController,
    this.secondInputController,
    this.secondInputFocusNode,
    this.firstInputMinimumValue,
    this.isDotDisabled = false,
  }) : super(child: child);

  final TextEditingController? firstInputController;
  final TextEditingController? secondInputController;

  final FocusNode firstInputFocusNode;
  final FocusNode? secondInputFocusNode;

  final NumberPadWidgetType type;

  final double? firstInputMinimumValue;
  final double firstInputMaximumValue;
  final double secondInputMinimumValue;
  final double? secondInputMaximumValue;

  final NumberFormat formatter;

  final String currency;

  final bool Function() isAllInputsValid;
  final bool Function() isFirstInputInRange;
  final bool Function() isSecondInputInRange;

  final TextEditingController? Function() focusedInput;

  final NumberPadLabel label;

  final bool isDotDisabled;

  static _NumberPadProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_NumberPadProvider>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
