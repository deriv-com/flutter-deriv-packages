import 'package:intl/intl.dart';

/// `day`
String get labelDay => Intl.message(
      'day',
      name: 'labelDay',
      args: [],
    );

/// `hr`
String get labelHour => Intl.message(
      'hr',
      name: 'labelHour',
      args: [],
    );

/// `min`
String get labelMinute => Intl.message(
      'min',
      name: 'labelMinute',
      args: [],
    );

/// `sec`
String get labelSecond => Intl.message(
      'sec',
      name: 'labelSecond',
      args: [],
    );

/// `days`
String get labelDays => Intl.message(
      'days',
      name: 'labelDays',
      args: [],
    );

/// `{minuteValue} minutes`
String labelMinutes(Object minuteValue) => Intl.message(
      '$minuteValue minutes',
      name: 'labelMinutes',
      args: [minuteValue],
    );

/// `{value} hours`
String labelHoursValue(Object value) => Intl.message(
      '$value hours',
      name: 'labelHoursValue',
      args: [value],
    );

/// `{value} days`
String labelDaysValue(Object value) => Intl.message(
      '$value days',
      name: 'labelDaysValue',
      args: [value],
    );

/// `1 Notification`
String get semanticNotificationCountIcon => Intl.message(
      '1 Notification',
      name: 'semanticNotificationCountIcon',
      args: [],
    );

/// `{count} Notifications`
String semanticNotificationsCountIcon(Object count) => Intl.message(
      '$count Notifications',
      name: 'semanticNotificationsCountIcon',
      args: [count],
    );

/// `Badge Indicator`
String get semanticBadgeIndicatorIcon => Intl.message(
      'Badge Indicator',
      name: 'semanticBadgeIndicatorIcon',
      args: [],
    );

/// `Close`
String get semanticCloseIcon => Intl.message(
      'Close',
      name: 'semanticCloseIcon',
      args: [],
    );

/// `Close`
String get labelClose => Intl.message(
      'Close',
      name: 'labelClose',
      args: [],
    );

/// `Confirm`
String get semanticConfirmIcon => Intl.message(
      'Confirm',
      name: 'semanticConfirmIcon',
      args: [],
    );

/// `Confirm`
String get labelConfirm => Intl.message(
      'Confirm',
      name: 'labelConfirm',
      args: [],
    );

/// `Selected range`
String get labelSelectedRange => Intl.message(
      'Selected range',
      name: 'labelSelectedRange',
      args: [],
    );

/// `Edit`
String get semanticEditIcon => Intl.message(
      'Edit',
      name: 'semanticEditIcon',
      args: [],
    );

/// `Edit`
String get labelEdit => Intl.message(
      'Edit',
      name: 'labelEdit',
      args: [],
    );

/// `Start date`
String get labelStartDate => Intl.message(
      'Start date',
      name: 'labelStartDate',
      args: [],
    );

/// `End date`
String get labelEndDate => Intl.message(
      'End date',
      name: 'labelEndDate',
      args: [],
    );

/// `Calendar`
String get semanticCalendarIcon => Intl.message(
      'Calendar',
      name: 'semanticCalendarIcon',
      args: [],
    );

/// `Calendar`
String get labelCalendar => Intl.message(
      'Calendar',
      name: 'labelCalendar',
      args: [],
    );

/// `CANCEL`
String get actionCancel => Intl.message(
      'CANCEL',
      name: 'actionCancel',
      args: [],
    );

/// `OK`
String get actionOK => Intl.message(
      'OK',
      name: 'actionOK',
      args: [],
    );

/// `Contract details`
String get labelContractDetails => Intl.message(
      'Contract details',
      name: 'labelContractDetails',
      args: [],
    );

/// `Number Pad widget handle`
String get semanticNumberPadBottomSheetHandle => Intl.message(
      'Number Pad widget handle',
      name: 'semanticNumberPadBottomSheetHandle',
      args: [],
    );

/// `{Input} can't be less than {minAmount} {currencySymbol}`
String warnValueCantBeLessThan(
        Object Input, Object minAmount, Object currencySymbol) =>
    Intl.message(
      '$Input can\'t be less than $minAmount $currencySymbol',
      name: 'warnValueCantBeLessThan',
      args: [Input, minAmount, currencySymbol],
    );

/// `{Input} can't be greater than {maxAmount} {currencySymbol}`
String warnValueCantBeGreaterThan(
        Object Input, Object maxAmount, Object currencySymbol) =>
    Intl.message(
      '$Input can\'t be greater than $maxAmount $currencySymbol',
      name: 'warnValueCantBeGreaterThan',
      args: [Input, maxAmount, currencySymbol],
    );

/// `Invalid {Input}. {Input} can't be less than {minAmount} {currencySymbol}`
String warnDoubleInputValueCantBeLessThan(
        Object Input, Object minAmount, Object currencySymbol) =>
    Intl.message(
      'Invalid $Input. $Input can\'t be less than $minAmount $currencySymbol',
      name: 'warnDoubleInputValueCantBeLessThan',
      args: [Input, minAmount, currencySymbol],
    );

/// `Invalid {Input}. {Input} can't be greater than {maxAmount}
/// {currencySymbol}`
String warnDoubleInputValueCantBeGreaterThan(
        Object Input, Object maxAmount, Object currencySymbol) =>
    Intl.message(
      'Invalid $Input. $Input can\'t be greater than $maxAmount '
          '$currencySymbol',
      name: 'warnDoubleInputValueCantBeGreaterThan',
      args: [Input, maxAmount, currencySymbol],
    );

/// `{Input} between {minAmountClear} {currencySymbol} and {maxAmount}
/// {currencySymbol}`
String warnValueShouldBeInRange(Object Input, Object minAmountClear,
        Object currencySymbol, Object maxAmount) =>
    Intl.message(
      '$Input between $minAmountClear $currencySymbol and $maxAmount '
          '$currencySymbol',
      name: 'warnValueShouldBeInRange',
      args: [Input, minAmountClear, currencySymbol, maxAmount],
    );

/// `Your gross profit is the percentage\nchange in market price times your\n
/// trade amount and the multiplier\nchosen here.`
String get informTradeAmountHint => Intl.message(
      'Your gross profit is the percentage\nchange in market price times your\n'
          'trade amount and the multiplier\nchosen here.',
      name: 'informTradeAmountHint',
      args: [],
    );

/// `Badge`
String get semanticBadgeIcon => Intl.message(
      'Badge',
      name: 'semanticBadgeIcon',
      args: [],
    );

/// `Trade amount`
String get labelTradeAmount => Intl.message(
      'Trade amount',
      name: 'labelTradeAmount',
      args: [],
    );

/// `Take profit`
String get labelTakeProfit => Intl.message(
      'Take profit',
      name: 'labelTakeProfit',
      args: [],
    );

/// `Stop loss`
String get labelStopLoss => Intl.message(
      'Stop loss',
      name: 'labelStopLoss',
    );
