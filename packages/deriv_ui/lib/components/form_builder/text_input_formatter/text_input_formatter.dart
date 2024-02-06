import 'package:flutter/services.dart';

part 'text_input_decimal_formatter.dart';

/// Set of helpers on the [TextInputFormatter].
extension TextInputFormatterExtension on TextInputFormatter {
  /// Returns a [TextInputFormatter] that only allows the user to enter decimal
  /// number with the given options.
  List<TextInputFormatter> decimal({
    int fractionDigits = 2,
    bool withSign = false,
  }) =>
      <TextInputFormatter>[
        FilteringTextInputFormatter.allow(
          RegExp(withSign ? r'[0-9.+-]' : r'[0-9.]'),
        ),
        TextInputDecimalFormatter(
          fractionDigits: fractionDigits,
          withSign: withSign,
        ),
      ];
}
