# Deriv Date Range Picker

This component provides a date range picker widget based on deriv theme.

## Features

- Provides a date range picker widget based on deriv theme.
- Supports both calendar and input mode.

## Getting started

In your library add the following import:

```dart
import 'package:deriv_ui/deriv_ui.dart';
```

In your MaterialApp add the `DateRangeLocalizations` delegate:


```dart
MaterialApp(
  localizationsDelegates: [
    DateRangeLocalizations.delegate,
    /// ... more localization delegates
  ],
)
```


## Usage

```dart
final dateChosen = await showDialog<DateRangeModel>(
                context: context,
                builder: (_) => DerivDateRangePicker(
                      context: context,
                      currentDate: DateTime.now(),
                      minAllowedDate: DateTime(2021, 1, 1),
                      maxAllowedDate: DateTime(2021, 12, 31),
                      initialStartDate: date.startDate,
                      initialEndDate: date.endDate,
                      mode: DateRangePickerMode.calendar,
                    ));
print(dateChosen); // Instance of 'DateRangeModel'
print(dateChosen.startDate); // Instance of 'DateTime'
```
