import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Stake value selector widget.
class ValueSelector extends StatelessWidget {
  /// Shows stake selector widget and updates the stake [value] based on the
  /// user's increase or decrease action.
  /// Both [onChange], and [value] arguments are required.
  const ValueSelector({
    required this.value,
    required this.currencySymbol,
    required this.currencyFractionalDigits,
    required this.onChange,
    required this.numberPadTitle,
    this.enableMarquee = true,
    this.isEnabled = true,
    this.unselectedValue,
    this.withError = false,
    this.showValueAsNegative = false,
    this.backgroundColor,
    this.dialogDescription,
    this.numberPadHeaderLeading,
    this.amountInputKey,
    this.decreaseButtonKey,
    this.increaseButtonKey,
    this.amountInputTextFieldKey,
    Key? key,
  }) : super(key: key);

  /// The value of the selected stake.
  final double? value;

  /// The currency symbol
  final String? currencySymbol;

  /// The callback function to update a change of the stake value.
  final Function(double? value)? onChange;

  /// Currency fractional digits number.
  final int? currencyFractionalDigits;

  /// Enables marquee.
  final bool enableMarquee;

  /// Indicates if the widget is enable or disable.
  final bool isEnabled;

  /// The disabled state placeholder text that is shown instead of the value.
  final String? unselectedValue;

  /// Determines if there is an error with stake.
  ///
  /// This default to false.
  final bool withError;

  /// Background color of the widget.
  final Color? backgroundColor;

  /// Whether or not the value shown on the stake selector should have a `-` in
  /// front. Mainly used for parameters such as `Stop Loss`.
  final bool showValueAsNegative;

  /// Description text of the dialog box shown when the [InfoIconButton]
  /// present on the [NumberPad] is pressed.
  ///
  /// If not set or set to `null`, the [InfoIconButton] will be hidden.
  final String? dialogDescription;

  /// The title text displayed on the head of the [NumberPad].
  final String numberPadTitle;

  /// Leading widget on the header of the [NumberPad] of this [ValueSelector].
  final Widget? numberPadHeaderLeading;

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
    double? selectedStakeValue = value;
    final bool isUSDAccount = currencySymbol == 'USD';
    final Color disabledColor = context.theme.colors.lessProminent
        .withOpacity(getOpacity(isEnabled: false));

    return AbsorbPointer(
      absorbing: !isEnabled,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ThemeProvider.borderRadius04),
        child: Material(
          type: MaterialType.transparency,
          child: Column(
            children: <Widget>[
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
                    if (currencySymbol != null && currencySymbol!.isEmpty)
                      const Center(child: LoadingIndicator()),
                    if (currencySymbol != null &&
                        currencySymbol!.isNotEmpty &&
                        selectedStakeValue != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            key: decreaseButtonKey,
                            icon: const Icon(Icons.remove),
                            color: !isEnabled ? disabledColor : null,
                            onPressed:
                            _decrement(selectedStakeValue, isUSDAccount) <=
                                0
                                ? null
                                : () {
                              final double newValue = _decrement(
                                  selectedStakeValue!, isUSDAccount);

                              if (newValue > 0) {
                                selectedStakeValue = newValue;
                                onChange?.call(newValue);
                              }
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
                                    _getStakeLabel(
                                      selectedValue: selectedStakeValue!,
                                      unselectedValue: unselectedValue,
                                    ),
                                    key: amountInputTextFieldKey,
                                    style: context.theme.textStyle(
                                      textStyle: TextStyles.body2,
                                      color: isEnabled ? null : disabledColor,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () => _showAndHandleStakeSelection(
                                context,
                                selectedStakeValue!,
                              ),
                            ),
                          ),
                          IconButton(
                            key: increaseButtonKey,
                            icon: const Icon(Icons.add),
                            color: !isEnabled ? disabledColor : null,
                            onPressed: () {
                              selectedStakeValue = isUSDAccount
                                  ? selectedStakeValue! + 1
                                  : double.parse(
                                  _increment(selectedStakeValue!));

                              onChange?.call(selectedStakeValue!);
                            },
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Gets the text that should be displayed on this [ValueSelector].
  String _getStakeLabel({
    required double selectedValue,
    String? unselectedValue,
  }) {
    String stake = _getStake(selectedValue);
    if (!isEnabled) {
      stake = unselectedValue ?? _getStake(selectedValue);
    }
    if (showValueAsNegative && selectedValue > 0) {
      stake = '-$stake';
    }

    return stake;
  }

  // Shows the stake num pad and handles on closed callback.
  void _showAndHandleStakeSelection(
      BuildContext context,
      double selectedStakeValue,
      ) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) => NumberPad(
        label: NumberPadLabel(actionOK: 'OK'),
        headerLeading: numberPadHeaderLeading,
        dialogDescription: dialogDescription,
        currency: currencySymbol,
        formatter: NumberFormat(),
        numberPadType: NumberPadWidgetType.singleInput,
        firstInputTitle: numberPadTitle,
        firstInputInitialValue:
        selectedStakeValue == 0 ? null : selectedStakeValue,
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

  String _increment(double value) {
    final int lengthOfDecimalPart = getFractionalDigitsLength(value);
    final double incrementedValue = value + _modifyBy(lengthOfDecimalPart);

    return incrementedValue
        .toStringAsFixed(lengthOfDecimalPart == 0 ? 2 : lengthOfDecimalPart);
  }

  double _decrement(double value, bool isUSDAccount) {
    if (isUSDAccount) {
      return value - 1;
    }
    final int lengthOfDecimalPart = getFractionalDigitsLength(value);
    final double decrementedValue = value - _modifyBy(lengthOfDecimalPart);
    return double.parse(decrementedValue
        .toStringAsFixed(lengthOfDecimalPart == 0 ? 2 : lengthOfDecimalPart));
  }

  double _modifyBy(int length) =>
      double.parse('${'0.'.padRight(1 + length, '0')}1');

  String _getStake(double? selectedStakeValue) =>
      '${selectedStakeValue?.toStringAsFixed(
        currencySymbol == 'USD'
            ? getCurrencyFractionalDigits(currencyFractionalDigits)
            : getFractionalDigitsLength(selectedStakeValue),
      )} ${getStringWithMappedCurrencyName(currencySymbol ?? '')}';
}

/*
/// Stake selector balance section widget.
class StakeSelectorBalanceSection extends StatelessWidget {
  /// Initializes a new [StakeSelectorBalanceSection].
  const StakeSelectorBalanceSection({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AccountsCubit, AccountsState>(
        bloc: BlocManager.instance.fetch<AccountsCubit>(),
        builder: (_, AccountsState state) {
          if (state is AccountsLoadedState) {
            return Container(
              width: double.infinity,
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _buildBalanceText(context, state),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      );

  Text _buildBalanceText(BuildContext context, AccountsLoadedState state) =>
      Text(
        '${context.localization.labelBalance}: ${getFormattedCurrencyValue(
          value: state.currentAccount?.balance,
          currency: state.currentAccount!.currency!,
        ) ?? ''}',
        key: WidgetKeys.balanceSetOrderSection,
        style: context.theme.textStyle(
          textStyle: TextStyles.caption,
          color: context.theme.colors.lessProminent,
        ),
      );
}
*/
