# Numberpad

A new Flutter project.

## Usage:

The `Numberpad` widget takes quite a few arguments, which are:

- `formatter` (required): A `NumberFormat` that is fetched from the `intl` package. Sets the format of the input text.
- `numberpadType` (required): Either `NumberPadWidgetType.singleInput` for a single text field, or `NumberPadWidgetType.doubleInput` for two text fields.
- `label` (required): `NumberPadLabel` is a class that contains a list of necessary strings basid on current localizaiton:

  - `semanticNumberPadBottomSheetHandle`: Description for the `semanticsLabel` property of the handle SVG at the top.
  - `actionOK`: The text on the `Ok` button in any open dialoge.
  - `warnValueCantBeLessThan`: Warning when the entered value is less that minimum amount.
  - `warnValueCantBeGreaterThan`: Warning when the entered value is greater that minimum amount.
  - `warnDoubleInputValueCantBeLessThan`: Warning when input is invalid because it can't be less than minimum amount.
  - `warnDoubleInputValueCantBeGreaterThan`: Warning when input is invalid because it can't be greater than minimum amount.
  - `warnValueShouldBeInRange`: Warning when value is not in valid range.

- `currency`: Sets the currency of the number pad.
- `firstInputTite`: Title of the first textfield.
- `secondInputTitle`: Title of the second textfield. (If input type is doubleInput)
- `manInputLength`: Maximum possible input characters for input values.
- `firstInputInitialValue`: The initial value of first text field.
- `secondInputInitialValue`: The initial value of second text field.
- `firstInputMinimumValue`: The minimum value in the first text field.
- `secondInputMinimumValue`: The minimum value in the second text field.
- `firstInputMaximumValue`: The maximum value int the first text field.
- `secondInputMaximumValue`: The maximum value int the second text field.
- `onOpen`: VoidCallback whem NumberPad opens.
- `onClose`: Callback when NumberPad closes. Takes 3 arguments (NumberadWidgetType, NumberPadCloseType, NumberPadData).
  - `NumberPadWidgetType`: Current `NumberPadWidgetType`.
  - `NumberPadCloseType`: `NumberPadCloseType.pressOK` for when the user clicks on the OK button to close numberPad widget. Or `NumberPadCloseType.clickOutsideView` for when the user clicks anywhere outside the widget to dismiss the NumberPad widget.
  - `NumberPadData`: A wrapper around the values in the first and second input text fields.
- `currentFocus`: When there are two text fields, you can choose which one has initial focus, either `NumberPadInputFocus.firstInputField` for a the first text field, or `NumberPadInputFocus.secondInputField` for the second text field.
- `dialogeDescription`: The description text displayed when the info icon is clicked.
- `headerLeading`: The leading widget on the header of the Numberpad.

## Example

```dart
NumberPad(
    formatter: NumberFormat.decimalPattern(),
    numberPadType: NumberPadWidgetType.singleInput,
    firstInputTitle: context.localization.labelTakeProfit,
    firstInputInitialValue: initialTPValue,
    secondInputTitle: context.localization.labelStopLoss,
    secondInputInitialValue: initialSLValue,
    currency: currency,
    onClose: (
      NumberPadWidgetType type,
      NumberPadCloseType closeType,
      NumberPadData result,
    ) async {
      if (closeType == NumberPadCloseType.pressOK) {
        widget.onTakeProfitStopLossChanged?.call(
          result.firstInputValue ?? -1,
          result.secondInputValue ?? -1,
        );
      }
    },
),
```
