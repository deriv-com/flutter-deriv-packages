import 'package:deriv_date_range_picker/src/core/helpers.dart';
import 'package:deriv_theme/deriv_theme_provider.dart';
import 'package:deriv_theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ContextExtension on BuildContext {
  /// Get localization.
  ThemeProvider get theme => DerivThemeProvider.getTheme(this);
}

/// Extension methods for [DateTime].
extension DateTimeExtension on DateTime {
  /// Get String format of the duration of a date time from now.
  String toFormattedDuration({
    required BuildContext context,
    required DateTime dateTime,
    bool showTime = true,
  }) {
    String dayPart;

    final Duration durationFromCurrentServerTime = difference(dateTime);
    final int days = durationFromCurrentServerTime.inDays;

    dayPart = getTimePartLabel(
      timePart: days,
      zeroLabel: '',
      // singularLabel: context.localization.labelDay,
      // pluralLabel: context.localization.labelDays,
      singularLabel: 'context.localization.labelDay',
      pluralLabel: 'context.localization.labelDays',
      formatter: NumberFormat('0'),
    );

    String timePart = '';

    if (showTime) {
      final NumberFormat formatter = NumberFormat('00');

      final int hours = durationFromCurrentServerTime.inHours.remainder(24);
      final int minutes = durationFromCurrentServerTime.inMinutes.remainder(60);

      timePart = '${formatter.format(hours)}:${formatter.format(minutes)}';
    }

    return '$dayPart $timePart'.trim();
  }
}
