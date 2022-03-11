import 'package:intl/intl.dart';

/// `day`
String get labelDay => Intl.message(
      'day',
      name: 'labelDay',
    );

/// `hr`
String get labelHour => Intl.message(
      'hr',
      name: 'labelHour',
    );

/// `min`
String get labelMinute => Intl.message(
      'min',
      name: 'labelMinute',
    );

/// `sec`
String get labelSecond => Intl.message(
      'sec',
      name: 'labelSecond',
    );

/// `days`
String get labelDays => Intl.message(
      'days',
      name: 'labelDays',
    );

/// `{minuteValue} minutes`
String labelMinutes(Object minuteValue) => Intl.message(
      '$minuteValue minutes',
      name: 'labelMinutes',
      args: <Object>[minuteValue],
    );

/// `{value} hours`
String labelHoursValue(Object value) => Intl.message(
      '$value hours',
      name: 'labelHoursValue',
      args: <Object>[value],
    );

/// `{value} days`
String labelDaysValue(Object value) => Intl.message(
      '$value days',
      name: 'labelDaysValue',
      args: <Object>[value],
    );

/// `1 Notification`
String get semanticNotificationCountIcon => Intl.message(
      '1 Notification',
      name: 'semanticNotificationCountIcon',
    );

/// `{count} Notifications`
String semanticNotificationsCountIcon(Object count) => Intl.message(
      '$count Notifications',
      name: 'semanticNotificationsCountIcon',
      args: <Object>[count],
    );

/// `Badge Indicator`
String get semanticBadgeIndicatorIcon => Intl.message(
      'Badge Indicator',
      name: 'semanticBadgeIndicatorIcon',
    );

/// `Close`
String get semanticCloseIcon => Intl.message(
      'Close',
      name: 'semanticCloseIcon',
    );

/// `Close`
String get labelClose => Intl.message(
      'Close',
      name: 'labelClose',
    );

/// `Confirm`
String get semanticConfirmIcon => Intl.message(
      'Confirm',
      name: 'semanticConfirmIcon',
    );

/// `Confirm`
String get labelConfirm => Intl.message(
      'Confirm',
      name: 'labelConfirm',
    );

/// `Selected range`
String get labelSelectedRange => Intl.message(
      'Selected range',
      name: 'labelSelectedRange',
    );

/// `Edit`
String get semanticEditIcon => Intl.message(
      'Edit',
      name: 'semanticEditIcon',
    );

/// `Edit`
String get labelEdit => Intl.message(
      'Edit',
      name: 'labelEdit',
    );

/// `Start date`
String get labelStartDate => Intl.message(
      'Start date',
      name: 'labelStartDate',
    );

/// `End date`
String get labelEndDate => Intl.message(
      'End date',
      name: 'labelEndDate',
    );

/// `Calendar`
String get semanticCalendarIcon => Intl.message(
      'Calendar',
      name: 'semanticCalendarIcon',
    );

/// `Calendar`
String get labelCalendar => Intl.message(
      'Calendar',
      name: 'labelCalendar',
    );

/// `CANCEL`
String get actionCancel => Intl.message(
      'CANCEL',
      name: 'actionCancel',
    );

/// `OK`
String get actionOK => Intl.message(
      'OK',
      name: 'actionOK',
    );

/// `Contract details`
String get labelContractDetails => Intl.message(
      'Contract details',
      name: 'labelContractDetails',
    );

/// `Number Pad widget handle`
String get semanticNumberPadBottomSheetHandle => Intl.message(
      'Number Pad widget handle',
      name: 'semanticNumberPadBottomSheetHandle',
    );

/// `{input} can't be less than {minAmount} {currencySymbol}`
String warnValueCantBeLessThan(
        Object input, Object minAmount, Object currencySymbol) =>
    Intl.message(
      '$input can\'t be less than $minAmount $currencySymbol',
      name: 'warnValueCantBeLessThan',
      args: <Object>[input, minAmount, currencySymbol],
    );

/// `{input} can't be greater than {maxAmount} {currencySymbol}`
String warnValueCantBeGreaterThan(
        Object input, Object maxAmount, Object currencySymbol) =>
    Intl.message(
      '$input can\'t be greater than $maxAmount $currencySymbol',
      name: 'warnValueCantBeGreaterThan',
      args: <Object>[input, maxAmount, currencySymbol],
    );

/// `Invalid {input}. {input} can't be less than {minAmount} {currencySymbol}`
String warnDoubleinputValueCantBeLessThan(
        Object input, Object minAmount, Object currencySymbol) =>
    Intl.message(
      'Invalid $input. $input can\'t be less than $minAmount $currencySymbol',
      name: 'warnDoubleinputValueCantBeLessThan',
      args: <Object>[input, minAmount, currencySymbol],
    );

/// `Invalid {input}. {input} can't be greater than {maxAmount}
/// {currencySymbol}`
String warnDoubleInputValueCantBeGreaterThan(
        Object input, Object maxAmount, Object currencySymbol) =>
    Intl.message(
      'Invalid $input. $input can\'t be greater than $maxAmount '
      '$currencySymbol',
      name: 'warnDoubleInputValueCantBeGreaterThan',
      args: <Object>[input, maxAmount, currencySymbol],
    );

/// `{input} between {minAmountClear} {currencySymbol} and {maxAmount}
/// {currencySymbol}`
String warnValueShouldBeInRange(Object input, Object minAmountClear,
        Object currencySymbol, Object maxAmount) =>
    Intl.message(
      '$input between $minAmountClear $currencySymbol and $maxAmount '
      '$currencySymbol',
      name: 'warnValueShouldBeInRange',
      args: <Object>[input, minAmountClear, currencySymbol, maxAmount],
    );

/// `Your gross profit is the percentage\nchange in market price times your\n
/// trade amount and the multiplier\nchosen here.`
String get informTradeAmountHint => Intl.message(
      'Your gross profit is the percentage\nchange in market price times your\n'
      'trade amount and the multiplier\nchosen here.',
      name: 'informTradeAmountHint',
    );

/// `Badge`
String get semanticBadgeIcon => Intl.message(
      'Badge',
      name: 'semanticBadgeIcon',
    );

/// `Trade amount`
String get labelTradeAmount => Intl.message(
      'Trade amount',
      name: 'labelTradeAmount',
    );

/// `Take profit`
String get labelTakeProfit => Intl.message(
      'Take profit',
      name: 'labelTakeProfit',
    );

/// `Stop loss`
String get labelStopLoss => Intl.message(
      'Stop loss',
      name: 'labelStopLoss',
    );
