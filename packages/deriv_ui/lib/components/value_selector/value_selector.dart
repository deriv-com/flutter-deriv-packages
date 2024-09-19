import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// value selector widget.
class ValueSelector extends StatelessWidget {
  /// Shows selector widget and updates the [value] based on the
  /// user's increase or decrease action.
  /// [onChange], [numberPadSubmitLabel], and [value] arguments are required.
  const ValueSelector({
    required this.value,
    required this.onChange,
    required this.numberPadLabel,
    this.enableMarquee = true,
    this.isEnabled = true,
    this.unselectedValue,
    this.withError = false,
    this.backgroundColor,
    this.dialogDescription,
    this.numberPadHeaderLeading,
    this.formatter,
    this.maximum,
    this.showMaximumSubtitle = false,
    this.maximumSubtitle,
    this.minimum,
    this.showMinimumSubtitle = false,
    this.minimumSubtitle,
    this.title,
    this.amountInputKey,
    this.decreaseButtonKey,
    this.increaseButtonKey,
    this.amountInputTextFieldKey,
    Key? key,
  }) : super(key: key);

  /// The value of the selected input.
  final double value;

  /// The callback function to update a change of the value.
  final Function(double? value)? onChange;

  /// Enables marquee.
  final bool enableMarquee;

  /// Indicates if the widget is enable or disable.
  final bool isEnabled;

  /// The disabled state placeholder text that is shown instead of the value.
  final String? unselectedValue;

  /// Determines if there is an error with value.
  ///
  /// This default to false.
  final bool withError;

  /// Background color of the widget.
  final Color? backgroundColor;

  /// Description text of the dialog box shown when the [InfoIconButton]
  /// present on the [NumberPad] is pressed.
  ///
  /// If not set or set to `null`, the [InfoIconButton] will be hidden.
  final String? dialogDescription;

  /// Leading widget on the header of the [NumberPad] of this [ValueSelector].
  final Widget? numberPadHeaderLeading;

  /// Minimum range value
  final double? minimum;

  /// Maximum range value
  final double? maximum;

  /// Should the minimum range subtitle be displayed
  final bool showMinimumSubtitle;

  /// Should the maximum range subtitle be displayed
  final bool showMaximumSubtitle;

  /// Maximum range subtitle
  final String? maximumSubtitle;

  /// Minimum range subtitle
  final String? minimumSubtitle;

  /// number formatter
  final NumberFormat? formatter;

  /// Label of the value selector.
  final String? title;

  /// Number pad label
  final NumberPadLabel numberPadLabel;

  /// Key for the amount input field.
  final Key? amountInputKey;

  /// Key for the decrease icon button.
  final Key? decreaseButtonKey;

  /// Key for the increase icon button.
  final Key? increaseButtonKey;

  /// Key for the amount input text field.
  final Key? amountInputTextFieldKey;

  @override
  Widget build(BuildContext context) {
    final Color disabledColor = context.theme.colors.lessProminent
        .withOpacity(getOpacity(isEnabled: false));

    return AbsorbPointer(
      absorbing: !isEnabled,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ThemeProvider.borderRadius04),
        child: Material(
          type: MaterialType.transparency,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (title != null)
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: ThemeProvider.margin08),
                  child: Text(title!,
                      style: context.theme.textStyle(
                        textStyle: TextStyles.caption,
                        color: context.theme.colors.general,
                      )),
                ),
              Ink(
                height: 40,
                decoration: BoxDecoration(
                  color: backgroundColor ?? context.theme.colors.secondary,
                  borderRadius:
                      BorderRadius.circular(ThemeProvider.borderRadius04),
                  border: withError
                      ? Border.all(color: context.theme.colors.danger)
                      : null,
                ),
                child: Stack(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          key: decreaseButtonKey,
                          icon: const Icon(Icons.remove),
                          color: !isEnabled ? disabledColor : null,
                          onPressed: _isLowerThanMinimum(value)
                              ? null
                              : () {
                                  final double decreasedValue =
                                      _decrement(value);
                                  onChange?.call(decreasedValue);
                                },
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.30,
                          child: InkWell(
                            key: amountInputKey,
                            borderRadius: BorderRadius.circular(
                              ThemeProvider.borderRadius04,
                            ),
                            child: Center(
                              child: Marquee(
                                enabled: enableMarquee,
                                child: Text(
                                  _getFormattedValue(value),
                                  key: amountInputTextFieldKey,
                                  style: context.theme.textStyle(
                                    textStyle: TextStyles.body2,
                                    color: isEnabled ? null : disabledColor,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () =>
                                _showAndHandleValueSelection(context, value),
                          ),
                        ),
                        IconButton(
                          key: increaseButtonKey,
                          icon: const Icon(Icons.add),
                          color: !isEnabled ? disabledColor : null,
                          onPressed: _isBiggerThanMaximum(value)
                              ? null
                              : () {
                                  final double increasedValue =
                                      _increment(value);
                                  onChange?.call(increasedValue);
                                },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (_shouldShowRange())
                Padding(
                  padding: const EdgeInsets.only(top: ThemeProvider.margin16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildMinimumRangeText(context),
                      _buildMaximumRangeText(context),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  bool _shouldShowRange() =>
      (minimum != null && showMinimumSubtitle) ||
      (maximum != null && showMaximumSubtitle);

  Widget _buildMinimumRangeText(BuildContext context) {
    String minimumText = '';
    if (minimum != null && showMinimumSubtitle) {
      minimumText =
          '${minimumSubtitle ?? 'Min range'}: ${_getFormattedValue(minimum!)}';
    }
    return Text(
      minimumText,
      style: context.theme.textStyle(
        textStyle: TextStyles.caption,
        color: context.theme.colors.lessProminent,
      ),
    );
  }

  Widget _buildMaximumRangeText(BuildContext context) {
    String maximumText = '';
    if (maximum != null && showMaximumSubtitle) {
      maximumText =
          '${maximumSubtitle ?? 'Max range'}: ${_getFormattedValue(maximum!)}';
    }
    return Text(
      maximumText,
      style: context.theme.textStyle(
        textStyle: TextStyles.caption,
        color: context.theme.colors.lessProminent,
      ),
    );
  }

  String _getFormattedValue(double value) {
    final NumberFormat numberFormat = formatter ?? NumberFormat('#,###');
    return numberFormat.format(value);
  }

  // Shows the num pad and handles on closed callback.
  void _showAndHandleValueSelection(
    BuildContext context,
    double selectedValue,
  ) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) => NumberPad(
        firstInputMinimumValue: minimum,
        firstInputMaximumValue: maximum != null ? maximum! : double.maxFinite,
        label: numberPadLabel,
        headerLeading: numberPadHeaderLeading,
        dialogDescription: dialogDescription,
        formatter: formatter ?? NumberFormat(),
        numberPadType: NumberPadWidgetType.singleInput,
        firstInputTitle: title ?? '',
        firstInputInitialValue: selectedValue == 0 ? null : selectedValue,
        onClose: (
          NumberPadWidgetType type,
          NumberPadCloseType closeType,
          NumberPadData result,
        ) async {
          if (closeType == NumberPadCloseType.pressOK) {
            onChange?.call(result.firstInputValue);
          }
        },
      ),
    );
  }

  double _increment(double value) {
    if (value == maximum) {
      return value;
    }
    return value + 1;
  }

  double _decrement(double value) {
    if (value == minimum) {
      return value;
    }
    return value - 1;
  }

  bool _isLowerThanMinimum(double value) =>
      minimum != null && value - minimum! < 1;

  bool _isBiggerThanMaximum(double value) =>
      maximum != null && maximum! - value < 1;
}
