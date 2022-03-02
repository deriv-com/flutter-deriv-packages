import 'package:intl/intl.dart';

/// `day`
String get labelDay => Intl.message(
    'day',
    name: 'labelDay',
    desc: '',
    args: [],
  );

/// `hr`
String get labelHour => Intl.message(
    'hr',
    name: 'labelHour',
    desc: '',
    args: [],
  );

/// `min`
String get labelMinute => Intl.message(
    'min',
    name: 'labelMinute',
    desc: '',
    args: [],
  );

/// `sec`
String get labelSecond => Intl.message(
    'sec',
    name: 'labelSecond',
    desc: '',
    args: [],
  );

/// `days`
String get labelDays => Intl.message(
    'days',
    name: 'labelDays',
    desc: '',
    args: [],
  );

/// `{minuteValue} minutes`
String labelMinutes(Object minuteValue) => Intl.message(
    '$minuteValue minutes',
    name: 'labelMinutes',
    desc: '',
    args: [minuteValue],
  );

/// `{value} hours`
String labelHoursValue(Object value) => Intl.message(
    '$value hours',
    name: 'labelHoursValue',
    desc: '',
    args: [value],
  );

/// `{value} days`
String labelDaysValue(Object value) => Intl.message(
    '$value days',
    name: 'labelDaysValue',
    desc: '',
    args: [value],
  );

/// `1 Notification`
String get semanticNotificationCountIcon => Intl.message(
    '1 Notification',
    name: 'semanticNotificationCountIcon',
    desc: '',
    args: [],
  );

/// `{count} Notifications`
String semanticNotificationsCountIcon(Object count) => Intl.message(
    '$count Notifications',
    name: 'semanticNotificationsCountIcon',
    desc: '',
    args: [count],
  );

/// `Badge Indicator`
String get semanticBadgeIndicatorIcon => Intl.message(
    'Badge Indicator',
    name: 'semanticBadgeIndicatorIcon',
    desc: '',
    args: [],
  );

/// `Close`
String get semanticCloseIcon => Intl.message(
    'Close',
    name: 'semanticCloseIcon',
    desc: '',
    args: [],
  );

/// `Close`
String get labelClose => Intl.message(
    'Close',
    name: 'labelClose',
    desc: '',
    args: [],
  );

/// `Confirm`
String get semanticConfirmIcon => Intl.message(
    'Confirm',
    name: 'semanticConfirmIcon',
    desc: '',
    args: [],
  );

/// `Confirm`
String get labelConfirm => Intl.message(
    'Confirm',
    name: 'labelConfirm',
    desc: '',
    args: [],
  );

/// `Selected range`
String get labelSelectedRange => Intl.message(
    'Selected range',
    name: 'labelSelectedRange',
    desc: '',
    args: [],
  );

/// `Edit`
String get semanticEditIcon => Intl.message(
    'Edit',
    name: 'semanticEditIcon',
    desc: '',
    args: [],
  );

/// `Edit`
String get labelEdit => Intl.message(
    'Edit',
    name: 'labelEdit',
    desc: '',
    args: [],
  );

/// `Start date`
String get labelStartDate => Intl.message(
    'Start date',
    name: 'labelStartDate',
    desc: '',
    args: [],
  );

/// `End date`
String get labelEndDate => Intl.message(
    'End date',
    name: 'labelEndDate',
    desc: '',
    args: [],
  );

/// `Calendar`
String get semanticCalendarIcon => Intl.message(
    'Calendar',
    name: 'semanticCalendarIcon',
    desc: '',
    args: [],
  );

/// `Calendar`
String get labelCalendar => Intl.message(
    'Calendar',
    name: 'labelCalendar',
    desc: '',
    args: [],
  );

/// `CANCEL`
String get actionCancel => Intl.message(
    'CANCEL',
    name: 'actionCancel',
    desc: '',
    args: [],
  );

/// `OK`
String get actionOK => Intl.message(
    'OK',
    name: 'actionOK',
    desc: '',
    args: [],
  );

/// `Contract details`
String get labelContractDetails => Intl.message(
    'Contract details',
    name: 'labelContractDetails',
    desc: '',
    args: [],
  );

/// `Number Pad widget handle`
String get semanticNumberPadBottomSheetHandle => Intl.message(
    'Number Pad widget handle',
    name: 'semanticNumberPadBottomSheetHandle',
    desc: '',
    args: [],
  );

/// `{Input} can't be less than {minAmount} {currencySymbol}`
String warnValueCantBeLessThan(
    Object Input, Object minAmount, Object currencySymbol) => Intl.message(
    '$Input can\'t be less than $minAmount $currencySymbol',
    name: 'warnValueCantBeLessThan',
    desc: '',
    args: [Input, minAmount, currencySymbol],
  );

/// `{Input} can't be greater than {maxAmount} {currencySymbol}`
String warnValueCantBeGreaterThan(
    Object Input, Object maxAmount, Object currencySymbol) => Intl.message(
    '$Input can\'t be greater than $maxAmount $currencySymbol',
    name: 'warnValueCantBeGreaterThan',
    desc: '',
    args: [Input, maxAmount, currencySymbol],
  );

/// `Invalid {Input}. {Input} can't be less than {minAmount} {currencySymbol}`
String warnDoubleInputValueCantBeLessThan(
    Object Input, Object minAmount, Object currencySymbol) => Intl.message(
    'Invalid $Input. $Input can\'t be less than $minAmount $currencySymbol',
    name: 'warnDoubleInputValueCantBeLessThan',
    desc: '',
    args: [Input, minAmount, currencySymbol],
  );

/// `Invalid {Input}. {Input} can't be greater than {maxAmount} {currencySymbol}`
String warnDoubleInputValueCantBeGreaterThan(
    Object Input, Object maxAmount, Object currencySymbol) => Intl.message(
    'Invalid $Input. $Input can\'t be greater than $maxAmount $currencySymbol',
    name: 'warnDoubleInputValueCantBeGreaterThan',
    desc: '',
    args: [Input, maxAmount, currencySymbol],
  );

/// `{Input} between {minAmountClear} {currencySymbol} and {maxAmount} {currencySymbol}`
String warnValueShouldBeInRange(Object Input, Object minAmountClear,
    Object currencySymbol, Object maxAmount) => Intl.message(
    '$Input between $minAmountClear $currencySymbol and $maxAmount $currencySymbol',
    name: 'warnValueShouldBeInRange',
    desc: '',
    args: [Input, minAmountClear, currencySymbol, maxAmount],
  );

/// `Your gross profit is the percentage\nchange in market price times your\ntrade amount and the multiplier\nchosen here.`
String get informTradeAmountHint => Intl.message(
    'Your gross profit is the percentage\nchange in market price times your\ntrade amount and the multiplier\nchosen here.',
    name: 'informTradeAmountHint',
    desc: '',
    args: [],
  );