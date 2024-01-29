/// Date range model.
class DateRangeModel {
  /// Initializes date range model.
  DateRangeModel({
    this.startDate,
    this.endDate,
    this.showCalendar,
  });

  /// Selected start date.
  final DateTime? startDate;

  /// Selected end date.
  final DateTime? endDate;

  /// Returns to calendar after setting date.
  final bool? showCalendar;
}
