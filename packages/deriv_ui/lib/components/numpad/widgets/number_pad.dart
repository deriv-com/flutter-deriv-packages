import 'dart:async';
import 'dart:ui' as ui;

import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../core/core.dart';
import '../models/models.dart';

part 'number_pad_animated_message.dart';
part 'number_pad_double_textfields.dart';
part 'number_pad_key_item.dart';
part 'number_pad_keypad.dart';
part 'number_pad_message.dart';
part 'number_pad_provider.dart';
part 'number_pad_single_text_title.dart';
part 'number_pad_single_textfield.dart';
part 'number_pad_text_field.dart';

/// A function that is called when the user pressed any button from the keypad.
///
/// This callback provides [BuildContext], current focused [TextEditingController]
/// and the most recent input as a [String] parameter.
typedef NumberPadKeyPressedCallback = Function(
    BuildContext, TextEditingController, String);

/// A function that is called when [NumberPad] has closed either by pressing OK
/// button or by touching outside of the [NumberPad] widget.
///
/// This callback provides two parameters:
///
/// [NumberPadWidgetType] which indicates that there is one input field or two input fields.
///
/// [NumberPadData] which contains two double values, one for each of the input values.
/// [closeType] specifies the way that the used have closed the [NumberPad]
/// If the input value equals [noInput] (-) for any of the input the corresponding
/// [NumberPadData] value will be null.
typedef NumberPadCloseCallback = Function(NumberPadWidgetType type,
    NumberPadCloseType closeType, NumberPadData result);

/// Input value when the user press ok button on keypad.
const String applyValuesInput = 'OK';

/// Input value when the user press backspace button to remove input.
const String backspaceInput = '<-';

/// Default input value when there is no initial value or all characters removed.
const String noInput = '';

/// Input value to add decimals as input
const String point = '.';

/// Data value which is returned when there is no input in [TextField]s and also for
/// second input data when [NumberPadWidgetType] is [NumberPadWidgetType.singleInput]
const String? returnedValueForEmpty = null;

/// NumberPad widget
class NumberPad extends StatefulWidget {
  /// This widget helps to display single or double input fields with customizable
  /// title, initial value and also to set minimum and maximum for each input separately
  ///
  /// [onOpen] event is called when the NumberPad widget has opened.
  ///
  /// [onClose] event is called when the user clicks apply button or clicks outside the
  /// bottom sheet. [onClose] event returns two parameters:
  ///
  /// [NumberPadWidgetType] which indicates that there is one input field or two input fields.
  ///
  /// [formatter] and [NumberPadWidgetType] are required parameters
  /// and other parameters are optional.
  ///
  /// If any of [TextField]s has [noInput] (-) value it returns the initial value and of the
  /// initial value is null it returns null as the result in [NumberPadData].
  ///
  /// This widget is dismissible by click OK button or by touching anywhere outside number pad
  const NumberPad({
    required this.formatter,
    required this.numberPadType,
    required this.label,
    this.currency,
    this.firstInputTitle = '',
    this.secondInputTitle = '',
    this.maxInputLength = 11,
    this.firstInputInitialValue,
    this.secondInputInitialValue,
    this.firstInputMinimumValue = 0,
    this.firstInputMaximumValue = double.maxFinite,
    this.secondInputMinimumValue = 0,
    this.secondInputMaximumValue = double.maxFinite,
    this.onOpen,
    this.onClose,
    this.currentFocus = NumberPadInputFocus.firstInputField,
    this.dialogDescription,
    this.headerLeading,
    this.isDotDisabled = false,
    Key? key,
  }) : super(key: key);

  /// This is the instance of Numberpad which has currency exchanger within it.
  ///
  /// It will return [NumberPadData] which contains the latest currency amount.
  factory NumberPad.withCurrencyExchanger({
    /// This information will be prefilled in the textField
    required CurrencyDetail primaryCurrency,

    /// stream of exchange rate of the currencies. Here,
    ///  [base_currency] should be same as [currencyType] in `primaryCurrency`.
    /// [target_currency] will be the currency shown in currency switcher.
    /// When there is a new exchange rate in this stream, the value in currency switcher changes.
    required Stream<ExchangeRateModel> exchangeRatesStream,

    /// The initial exchange rate for the currency provided.
    required ExchangeRateModel initialExchangeRate,

    /// Any validation for currencies.
    required NumberPadLabel label,

    /// Calls when this widget is closed.
    NumberPadCloseCallback? onClose,
    String title = '',
  }) =>
      _NumpadWithExchange(
        label: label,
        primaryCurrency: primaryCurrency,
        exchangeRatesStream: exchangeRatesStream,
        initialExchangeRate: initialExchangeRate,
        title: title,
        onClose: onClose,
      );

  /// Sets the currency of the number pad
  ///
  /// The currency code that will be shown on the right side of the number pad text input area.
  final String? currency;

  /// Sets the format of input text
  ///
  /// This length applies to all available [TextField]s exist in the [BottomSheet]
  final NumberFormat formatter;

  /// Maximum possible input characters for input values.
  ///
  /// This length is applied to all available [TextField]s exist in the [BottomSheet].
  final int maxInputLength;

  /// Class that contains all the texts used in the [NumberPad].
  final NumberPadLabel label;

  /// Sets the number  of the [TextField]s in [BottomSheet].
  ///
  /// [NumberPadWidgetType.singleInput] shows one [TextField].
  ///
  /// [NumberPadWidgetType.doubleInput] shows two [TextField]s.
  final NumberPadWidgetType numberPadType;

  /// The Title which is displayed at the top of the first Input value.
  ///
  /// When using [NumberPadWidgetType.singleInput], this is the title of main [TextField].
  ///
  /// When using [NumberPadWidgetType.doubleInput], this title is displayed at top of the left side [TextField].
  ///
  /// The default value is null.
  final String firstInputTitle;

  /// The title to be displayed at the top of the second [TextField].
  ///
  /// It will be only displayed when [numberPadType] is [NumberPadWidgetType.doubleInput].
  final String secondInputTitle;

  /// The initial value of first [TextField].
  ///
  /// When using [NumberPadWidgetType.singleInput], this is the initial value of
  /// the main [TextField].
  ///
  /// When using [NumberPadWidgetType.doubleInput], this is the initial value
  /// of the left [TextField].
  final double? firstInputInitialValue;

  /// The initial value of the second [TextField] on the right and only used
  /// by setting [numberPadType] to [NumberPadWidgetType.doubleInput].
  final double? secondInputInitialValue;

  /// The callback that is called when the [NumberPad] BottomSheet has been opened.
  final VoidCallback? onOpen;

  /// The callback that is called when the user taps outside of the [BottomSheet] or
  /// when the user submits the changes.
  final NumberPadCloseCallback? onClose;

  /// The minimum allowed input value of the first input.
  ///
  /// By default, no minimum limit will be applied.
  final double? firstInputMinimumValue;

  /// The maximum allowed input value of the first input.
  ///
  /// By default, no maximum limit will be applied.
  final double firstInputMaximumValue;

  /// The minimum allowed input value of the second input.
  ///
  /// By default, no minimum limit will be applied.
  final double secondInputMinimumValue;

  /// The maximum allowed input value of the second input.
  ///
  /// By default, no maximum limit will be applied.
  final double? secondInputMaximumValue;

  /// The focused input field when the [NumberPad] opens.
  ///
  /// By default, should be the first input field.
  final NumberPadInputFocus currentFocus;

  /// The description text displayed when the [InfoIconButton] on the header of
  /// this [NumberPad] is pressed.
  ///
  /// If not set, the [InfoIconButton] will not be displayed.
  final String? dialogDescription;

  /// The flag to disable the dot button on the keypad.
  final bool isDotDisabled;

  /// The leading widget on the header of this [NumberPad].
  final Widget? headerLeading;

  @override
  State<StatefulWidget> createState() => _NumberPadState();
}

class _NumberPadState extends State<NumberPad> {
  late String _currency;
  late NumberFormat _formatter;
  TextEditingController? _firstInputController;
  TextEditingController? _secondInputController;
  late ExchangeController _exchangeController;
  late FocusNode _firstInputFocusNode;
  FocusNode? _secondInputFocusNode;

  @override
  void initState() {
    super.initState();

    _currency = widget.currency ?? '';
    _formatter = widget.formatter;
    _firstInputController = TextEditingController();
    _firstInputFocusNode = FocusNode();
    _firstInputController?.text = _getFirstInputControllerText();

    if (widget.numberPadType == NumberPadWidgetType.doubleInput) {
      _secondInputController = TextEditingController();
      _secondInputFocusNode = FocusNode();
      _secondInputController?.text = widget.secondInputInitialValue == null
          ? noInput
          : _formatter.format(widget.secondInputInitialValue);
    }

    if (widget.currentFocus == NumberPadInputFocus.firstInputField) {
      _firstInputFocusNode.requestFocus();
    } else {
      _secondInputFocusNode?.requestFocus();
    }

    widget.onOpen?.call();
  }

  String _getFirstInputControllerText() {
    if (widget.firstInputInitialValue != null) {
      return _formatter.format(widget.firstInputInitialValue);
    } else {
      return noInput;
    }
  }

  @override
  Widget build(BuildContext ctx) => _buildWholeNumpad(context);

  Widget _buildWholeNumpad(BuildContext context) => _NumberPadProvider(
        type: widget.numberPadType,
        label: widget.label,
        formatter: _formatter,
        currency: _currency,
        firstInputController: _firstInputController,
        secondInputController: _secondInputController,
        firstInputFocusNode: _firstInputFocusNode,
        secondInputFocusNode: _secondInputFocusNode,
        firstInputMinimumValue: widget.firstInputMinimumValue,
        firstInputMaximumValue: widget.firstInputMaximumValue,
        secondInputMinimumValue: widget.secondInputMinimumValue,
        secondInputMaximumValue: widget.secondInputMaximumValue,
        focusedInput: _getFocusedInput,
        isSecondInputInRange: _isSecondInputInRange,
        isFirstInputInRange: _isFirstInputInRange,
        isAllInputsValid: _isAllInputsValid,
        isDotDisabled: widget.isDotDisabled,
        child: Builder(
          builder: (BuildContext context) => WillPopScope(
            onWillPop: () async {
              _applyInputs(NumberPadCloseType.clickOutsideView);

              return Future<bool>.value(true);
            },
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: context.theme.colors.primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(ThemeProvider.borderRadius16),
                      topRight: Radius.circular(ThemeProvider.borderRadius16),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: ThemeProvider.margin16,
                        ),
                        decoration: BoxDecoration(
                          color: context.theme.colors.secondary,
                          borderRadius: const BorderRadius.only(
                            topLeft:
                                Radius.circular(ThemeProvider.borderRadius16),
                            topRight:
                                Radius.circular(ThemeProvider.borderRadius16),
                          ),
                        ),
                        child: Align(
                          child: InkWell(
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(ThemeProvider.margin08),
                              child: SvgPicture.asset(
                                handleIcon,
                                package: 'deriv_ui',
                                width: ThemeProvider.margin40,
                                height: ThemeProvider.margin04,
                                semanticsLabel: widget
                                    .label.semanticNumberPadBottomSheetHandle,
                              ),
                            ),
                            onTap: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                      widget.numberPadType == NumberPadWidgetType.singleInput
                          ? _NumberPadSingleTextField(
                              leading: widget.headerLeading,
                              title: widget.firstInputTitle,
                              dialogDescription: widget.dialogDescription,
                            )
                          : _NumberPadDoubleTextFields(
                              firstTitleValue: widget.firstInputTitle,
                              secondTitleValue: widget.secondInputTitle,
                            ),
                      getCustomValidationText(context) != null
                          ? _NumberPadMessage(
                              messageText: getCustomValidationText(context))
                          : _NumberPadMessage(message: _validateMessage()),
                      _NumberPadKeypadWidget(
                        onKeyPressed: _onKeyboardButtonPressed,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  void _onKeyboardButtonPressed(
    BuildContext context,
    TextEditingController controller,
    String text,
  ) {
    switch (text) {
      case applyValuesInput:
        if (ExchangeNotifier.of(context) != null) {
          final double returningValue =
              ExchangeNotifier.of(context)!.finalAmount();
          final NumberPadData data = NumberPadData(
            firstInputValue: returningValue,
          );
          widget.onClose?.call(NumberPadWidgetType.doubleInput,
              NumberPadCloseType.pressOK, data);
          return Navigator.of(context).pop(data);
        }
        _applyInputs(NumberPadCloseType.pressOK);
        break;
      case backspaceInput:
        _handleBackSpace(controller);
        break;

      default:
        if (_isInputValid(context, controller, text)) {
          _setNewAmount(controller, text);
        }
    }
    ExchangeNotifier.of(context)?.onChangeCurrency(controller.text);
  }

  void _applyInputs(NumberPadCloseType closeStyle) {
    String? secondValue = returnedValueForEmpty;
    // TODO(Emad): replace ternaries with if conditions.
    final String? firstValue = hasNoValue(_firstInputController?.text) ||
            !isBetweenLimits(
              value: _firstInputController?.text ?? '',
              upperLimit: widget.firstInputMaximumValue,
              lowerLimit: widget.firstInputMinimumValue ?? 0,
            )
        ? widget.firstInputInitialValue == null
            ? returnedValueForEmpty
            : closeStyle == NumberPadCloseType.clickOutsideView
                ? '${widget.firstInputInitialValue}'
                : returnedValueForEmpty
        : _firstInputController?.text;

    if (widget.numberPadType == NumberPadWidgetType.doubleInput) {
      // TODO(Emad): replace ternaries with if conditions.
      secondValue = hasNoValue(_secondInputController?.text) ||
              !isBetweenLimits(
                value: _secondInputController?.text ?? '',
                upperLimit: widget.secondInputMaximumValue!,
                lowerLimit: widget.secondInputMinimumValue,
              )
          ? widget.secondInputInitialValue == null
              ? returnedValueForEmpty
              : closeStyle == NumberPadCloseType.clickOutsideView
                  ? '${widget.secondInputInitialValue}'
                  : returnedValueForEmpty
          : _secondInputController?.text;
    }
    final NumberPadData data = NumberPadData(
      firstInputValue: firstValue == null ? null : double.tryParse(firstValue),
      secondInputValue:
          secondValue == null ? null : double.tryParse(secondValue),
    );

    widget.onClose?.call(NumberPadWidgetType.doubleInput, closeStyle, data);

    Navigator.pop(context, data);
  }

  RichText? getCustomValidationText(BuildContext context) {
    final NumpadValidationText? Function(String value)? onValidate =
        _NumberPadProvider.of(context)?.label.onValidate;
    if (onValidate == null) {
      return null;
    } else {
      if (ExchangeNotifier.of(context) != null) {
        final String? amountInString =
            ExchangeNotifier.of(context)?.finalAmount() != 0.0
                ? ExchangeNotifier.of(context)?.finalAmount().toString()
                : '';
        final RichText? richText = onValidate(amountInString ?? '')?.text;
        return richText;
      }
      final RichText? richText =
          onValidate(_firstInputController?.text ?? '')?.text;
      return richText;
    }
  }

  String _validateMessage() {
    String message = '';

    if (!hasNoValue(_firstInputController?.text)) {
      final bool isFirstLessThanMax = isLessOrEqualLimit(
          value: _firstInputController?.text ?? '',
          upperLimit: widget.firstInputMaximumValue);

      final bool isFirstMoreThanMin = isMoreOrEqualLimit(
          value: _firstInputController?.text ?? '',
          lowerLimit: widget.firstInputMinimumValue ?? 0);

      if (!isFirstMoreThanMin) {
        final String Function(
                Object input, Object minAmount, Object currencySymbol)?
            callback = widget.label.warnValueCantBeLessThan;
        return message = callback?.call(
              widget.firstInputTitle,
              widget.firstInputMinimumValue ?? 0,
              getStringWithMappedCurrencyName(_currency),
            ) ??
            '';
      } else if (!isFirstLessThanMax) {
        final String Function(
                Object input, Object maxAmount, Object currencySymbol)?
            callback = widget.label.warnValueCantBeGreaterThan;
        return message = callback?.call(
              widget.firstInputTitle,
              widget.firstInputMaximumValue,
              getStringWithMappedCurrencyName(_currency),
            ) ??
            '';
      }
    }
    if (widget.numberPadType == NumberPadWidgetType.doubleInput) {
      if (!hasNoValue(_secondInputController?.text)) {
        final bool isSecondLessThanMax = isLessOrEqualLimit(
            value: _secondInputController?.text ?? '',
            upperLimit: widget.secondInputMaximumValue!);

        final bool isSecondMoreThanMin = isMoreOrEqualLimit(
            value: _secondInputController?.text ?? '',
            lowerLimit: widget.secondInputMinimumValue);

        if (!isSecondMoreThanMin) {
          final String Function(
                  Object input, Object minAmount, Object currencySymbol)?
              callback = widget.label.warnDoubleInputValueCantBeLessThan;
          return message = callback?.call(
                widget.secondInputTitle,
                widget.secondInputMinimumValue,
                getStringWithMappedCurrencyName(_currency),
              ) ??
              '';
        } else if (!isSecondLessThanMax) {
          final String Function(
                  Object input, Object maxAmount, Object currencySymbol)?
              callback = widget.label.warnDoubleInputValueCantBeGreaterThan;
          return message = callback?.call(
                widget.secondInputTitle,
                widget.secondInputMaximumValue!,
                getStringWithMappedCurrencyName(_currency),
              ) ??
              '';
        }
      }
    } else if (widget.firstInputMinimumValue != null &&
        widget.firstInputMaximumValue != double.maxFinite) {
      final String Function(
          Object input,
          Object minAmountClear,
          Object currencySymbol,
          Object maxAmount)? callback = widget.label.warnValueShouldBeInRange;
      return callback?.call(
            widget.firstInputTitle,
            widget.firstInputMinimumValue ?? 0,
            getStringWithMappedCurrencyName(_currency),
            widget.firstInputMaximumValue,
          ) ??
          '';
    }
    return message;
  }

  void _handleBackSpace(TextEditingController controller) {
    final String text = controller.text;
    if (text.isEmpty) {
      return;
    }

    final String lastCharacter = text.substring(text.length - 1);
    final String remaining = text.substring(0, text.length - 1);

    if (isNumber(lastCharacter) || lastCharacter == point) {
      controller.clear();
      _setNewAmount(controller, remaining);
    }
  }

  void _setNewAmount(TextEditingController controller, String newAmount) {
    if (controller.text.isNotEmpty &&
        controller.text == '0' &&
        newAmount != point) {
      controller.clear();
    }

    if (controller.text.isEmpty && newAmount == point) {
      controller.text = '0';
    }

    controller.text = controller.text + newAmount;
    final TextSelection selection =
        TextSelection.collapsed(offset: controller.text.length);
    controller.selection = selection;

    setState(() {});
  }

  bool _isInputValid(
    BuildContext context,
    TextEditingController controller,
    String input,
  ) {
    /// Increment maxInputLength by 1 because it counts the symbol one character
    final String currentText = controller.text;
    if (currentText.length >= (widget.maxInputLength + 1)) {
      return false;
    } else if (currentText == '0' && input == '0') {
      return false;
    } else if (currentText.contains(point) && input == point) {
      return false;
    } else if (!hasValidPrecision(
        value: '$currentText$input',
        validDecimalNumber: _getDecimalNumber(context))) {
      return false;
    }
    return true;
  }

  int _getDecimalNumber(BuildContext ctx) =>
      ExchangeNotifier.of(ctx)?.activeNumberFormat.maximumFractionDigits ??
      _formatter.maximumFractionDigits;

  TextEditingController? _getFocusedInput() {
    if (widget.numberPadType == NumberPadWidgetType.singleInput) {
      return _firstInputController;
    } else if (widget.numberPadType == NumberPadWidgetType.doubleInput) {
      if (_firstInputFocusNode.hasFocus) {
        return _firstInputController;
      } else {
        return _secondInputController;
      }
    }
    return null;
  }

  bool _isAllInputsValid() {
    if (widget.numberPadType == NumberPadWidgetType.singleInput) {
      return _isFirstInputInRange();
    } else {
      return _isFirstInputInRange() && _isSecondInputInRange();
    }
  }

  bool _isFirstInputInRange() =>
      !hasNoValue(_firstInputController?.text) &&
      isBetweenLimits(
        value: _firstInputController?.text ?? '',
        upperLimit: widget.firstInputMaximumValue,
        lowerLimit: widget.firstInputMinimumValue ?? 0,
      );

  bool _isSecondInputInRange() =>
      hasNoValue(_secondInputController?.text) ||
      isBetweenLimits(
        value: _secondInputController?.text ?? '',
        upperLimit: widget.secondInputMaximumValue!,
        lowerLimit: widget.secondInputMinimumValue,
      );
}

class _NumpadWithExchange extends NumberPad {
  _NumpadWithExchange({
    required NumberPadLabel label,
    required this.primaryCurrency,
    required this.exchangeRatesStream,
    required this.initialExchangeRate,
    required String title,
    NumberPadCloseCallback? onClose,
  }) : super(
          numberPadType: NumberPadWidgetType.singleInput,
          formatter: primaryCurrency.formatter,
          label: label,
          firstInputTitle: title,
          onClose: onClose,
        );

  final CurrencyDetail primaryCurrency;

  final Stream<ExchangeRateModel> exchangeRatesStream;

  final ExchangeRateModel initialExchangeRate;

  @override
  State<StatefulWidget> createState() => _NumberPadWithExchangeState(
        exchangeRatesStream: exchangeRatesStream,
        initialExchangeRate: initialExchangeRate,
        primaryCurrency: primaryCurrency,
      );
}

class _NumberPadWithExchangeState extends _NumberPadState {
  _NumberPadWithExchangeState({
    required this.primaryCurrency,
    required this.exchangeRatesStream,
    required this.initialExchangeRate,
  });
  final CurrencyDetail primaryCurrency;
  final Stream<ExchangeRateModel> exchangeRatesStream;
  final ExchangeRateModel initialExchangeRate;

  @override
  void initState() {
    super.initState();
    super._firstInputController!.text = primaryCurrency.displayAmount;
    _exchangeController = ExchangeController(
      primaryCurrency: primaryCurrency,
      currencyFieldController: super._firstInputController!,
      rateSource: exchangeRatesStream,
      initialExchangeRate: initialExchangeRate,
    );
  }

  @override
  Widget build(BuildContext context) => ExchangeNotifier(
        child: super.build(context),
        notifier: _exchangeController,
      );
}
