import 'dart:ui' as ui;

import 'package:deriv_ui/core/extensions/context_extension.dart';
import 'package:deriv_ui/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../assets.dart';
import '../../enums.dart';
import '../../helpers/number_helper.dart';
import '../../helpers/website_status_helper.dart';
import '../custom_tooltip.dart';
import 'model/number_pad_data.dart';
import 'model/number_pad_field_model.dart';

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
    this.numberPadSingleTextFieldModel=const NumberPadSingleTextFieldModel(),
    this.numberPadDoubleTextFieldModel=const NumberPadDoubleTextFieldModel(),
    this.backgroundColor,
    this.backgroundColorSecond,
    this.topLeft = 0,
    this.topRight = 0,
    this.paddingSecond,
    this.iconPadding = const EdgeInsets.all(0),
    this.topLeftSecond = 0,
    this.topRightSecond = 0,
    this.numberPadMessageModel=const NumberPadMessageModel(),
  });

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

  final NumberPadSingleTextFieldModel? numberPadSingleTextFieldModel;
  final NumberPadDoubleTextFieldModel? numberPadDoubleTextFieldModel;

  final Color? backgroundColor;
  final Color? backgroundColorSecond;
  final double topLeft;
  final double topRight;
  final EdgeInsetsGeometry? paddingSecond;
  final EdgeInsetsGeometry iconPadding;
  final double topLeftSecond;
  final double topRightSecond;
  final NumberPadMessageModel? numberPadMessageModel;

  @override
  State<StatefulWidget> createState() => _NumberPadState();
}

class _NumberPadState extends State<NumberPad> {
  late String _currency;
  late NumberFormat _formatter;
  TextEditingController? _firstInputController;
  TextEditingController? _secondInputController;
  late FocusNode _firstInputFocusNode;
  FocusNode? _secondInputFocusNode;

  @override
  void initState() {
    super.initState();

    _currency = widget.currency ?? '';
    _formatter = widget.formatter;
    _firstInputController = TextEditingController();
    _firstInputFocusNode = FocusNode();
    _firstInputController?.text = widget.firstInputInitialValue == null
        ? noInput
        : _formatter.format(widget.firstInputInitialValue);

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

  @override
  Widget build(BuildContext context) => _NumberPadProvider(
        type: widget.numberPadType,
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
        child: WillPopScope(
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
                    color: widget.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(widget.topLeft),
                      topRight: Radius.circular(widget.topRight),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: widget.paddingSecond,
                        decoration: BoxDecoration(
                          color: widget.backgroundColorSecond,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(widget.topLeftSecond),
                            topRight: Radius.circular(widget.topRightSecond),
                          ),
                        ),
                        child: Align(
                          child: InkWell(
                            child: Padding(
                              padding: widget.iconPadding,
                              child: SvgPicture.asset(
                                handleIcon,
                                width: 40,
                                height: 4,
                                semanticsLabel: context.localization
                                    .semanticNumberPadBottomSheetHandle,
                              ),
                            ),
                            onTap: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                      widget.numberPadType == NumberPadWidgetType.singleInput
                          ? _NumberPadSingleTextField(
                              title: widget.firstInputTitle,
                              style:
                                  widget.numberPadSingleTextFieldModel?.style ??
                                      const TextStyle(),
                              numberPadFieldModel: widget
                                  .numberPadSingleTextFieldModel
                                  ?.numberPadFieldModel,
                              label:
                                  widget.numberPadSingleTextFieldModel?.label ??
                                      '',
                              margin: widget
                                      .numberPadSingleTextFieldModel?.margin ??
                                  0,
                              currencyLabelStyle: widget
                                  .numberPadSingleTextFieldModel
                                  ?.currencyLabelStyle,
                            )
                          : _NumberPadDoubleTextFields(
                              firstTitleValue: widget.firstInputTitle,
                              secondTitleValue: widget.secondInputTitle,
                              currencyTextStyle: widget
                                  .numberPadDoubleTextFieldModel
                                  ?.currencyTextStyle,
                              numberPadFieldModelFirst: widget
                                  .numberPadDoubleTextFieldModel
                                  ?.numberPadFieldModelFirst,
                              numberPadFieldModelSecond: widget
                                  .numberPadDoubleTextFieldModel
                                  ?.numberPadFieldModelSecond,
                              paddingFirstTitle: widget
                                  .numberPadDoubleTextFieldModel
                                  ?.paddingSecondTitle,
                              paddingSecondTitle: widget
                                  .numberPadDoubleTextFieldModel
                                  ?.paddingSecondTitle,
                            ),
                      _NumberPadMessage(
                        message: _validateMessage(),
                        inValidTextStyle:
                            widget.numberPadMessageModel?.inValidTextStyle,
                        validTextStyle:
                            widget.numberPadMessageModel?.validTextStyle,
                        padding: widget.numberPadMessageModel?.padding,
                      ),
                      _NumberPadKeypadWidget(
                        onKeyPressed: _onKeyboardButtonPressed,
                      )
                    ],
                  )),
            ],
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
        _applyInputs(NumberPadCloseType.pressOK);
        break;
      case backspaceInput:
        _handleBackSpace(controller);
        break;

      default:
        if (_isInputValid(controller, text)) {
          _setNewAmount(controller, text);
        }
    }
  }

  void _applyInputs(NumberPadCloseType closeStyle) {
    String? _secondValue = returnedValueForEmpty;
    // TODO(Emad): replace ternaries with if conditions.
    final String? _firstValue = hasNoValue(_firstInputController?.text) ||
            !isBetweenLimits(
              stringValue: _firstInputController?.text ?? '',
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
      _secondValue = hasNoValue(_secondInputController?.text) ||
              !isBetweenLimits(
                stringValue: _secondInputController?.text ?? '',
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
      firstInputValue:
          _firstValue == null ? null : double.tryParse(_firstValue),
      secondInputValue:
          _secondValue == null ? null : double.tryParse(_secondValue),
    );

    widget.onClose?.call(NumberPadWidgetType.doubleInput, closeStyle, data);

    Navigator.pop(context, data);
  }

  String _validateMessage() {
    String message = '';

    if (!hasNoValue(_firstInputController?.text)) {
      final bool isFirstLessThanMax = isLessOrEqualLimit(
          stringValue: _firstInputController?.text ?? '',
          upperLimit: widget.firstInputMaximumValue);

      final bool isFirstMoreThanMin = isMoreOrEqualLimit(
          stringValue: _firstInputController?.text ?? '',
          lowerLimit: widget.firstInputMinimumValue ?? 0);

      if (!isFirstMoreThanMin) {
        return message = context.localization.warnValueCantBeLessThan(
          widget.firstInputTitle,
          widget.firstInputMinimumValue ?? 0,
          getStringWithMappedCurrencyName(_currency),
        );
      } else if (!isFirstLessThanMax) {
        return message = context.localization.warnValueCantBeGreaterThan(
          widget.firstInputTitle,
          widget.firstInputMaximumValue,
          getStringWithMappedCurrencyName(_currency),
        );
      }
    }
    if (widget.numberPadType == NumberPadWidgetType.doubleInput) {
      if (!hasNoValue(_secondInputController?.text)) {
        final bool isSecondLessThanMax = isLessOrEqualLimit(
            stringValue: _secondInputController?.text ?? '',
            upperLimit: widget.secondInputMaximumValue!);

        final bool isSecondMoreThanMin = isMoreOrEqualLimit(
            stringValue: _secondInputController?.text ?? '',
            lowerLimit: widget.secondInputMinimumValue);

        if (!isSecondMoreThanMin) {
          return message =
              context.localization.warnDoubleInputValueCantBeLessThan(
            widget.secondInputTitle,
            widget.secondInputMinimumValue,
            getStringWithMappedCurrencyName(_currency),
          );
        } else if (!isSecondLessThanMax) {
          return message =
              context.localization.warnDoubleInputValueCantBeGreaterThan(
            widget.secondInputTitle,
            widget.secondInputMaximumValue!,
            getStringWithMappedCurrencyName(_currency),
          );
        }
      }
    } else if (widget.firstInputMinimumValue != null &&
        widget.firstInputMaximumValue != double.maxFinite) {
      return message = context.localization.warnValueShouldBeInRange(
        widget.firstInputTitle,
        widget.firstInputMinimumValue ?? 0,
        getStringWithMappedCurrencyName(_currency),
        widget.firstInputMaximumValue,
      );
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

    controller.text = controller.text + newAmount;
    final TextSelection selection =
        TextSelection.collapsed(offset: controller.text.length);
    controller.selection = selection;

    setState(() {});
  }

  bool _isInputValid(TextEditingController controller, String input) {
    /// Increment maxInputLength by 1 because it counts the symbol one character
    final String currentText = controller.text;
    if (currentText.length >= (widget.maxInputLength + 1)) {
      return false;
    } else if (currentText == '0' && input == '0') {
      return false;
    } else if (currentText.contains(point) && input == point) {
      return false;
    } else if (currentText.isEmpty && input == point) {
      return false;
    } else if (!hasValidPrecision(
        stringValue: '$currentText$input',
        validDecimalNumber: _formatter.maximumFractionDigits)) {
      return false;
    }
    return true;
  }

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
      hasNoValue(_firstInputController?.text) ||
      isBetweenLimits(
        stringValue: _firstInputController?.text ?? '',
        upperLimit: widget.firstInputMaximumValue,
        lowerLimit: widget.firstInputMinimumValue ?? 0,
      );

  bool _isSecondInputInRange() =>
      hasNoValue(_secondInputController?.text) ||
      isBetweenLimits(
        stringValue: _secondInputController?.text ?? '',
        upperLimit: widget.secondInputMaximumValue!,
        lowerLimit: widget.secondInputMinimumValue,
      );
}
