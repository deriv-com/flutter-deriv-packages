/// Service for logging indicator events.
abstract class TrackingEventService {
  /// Log when user opens indicator types bottom sheet.
  void logOpenIndicatorTypesBottomSheet();

  /// Log when user closes indicator types bottom sheet.
  void logCloseIndicatorTypesBottomSheet();

  /// Log when user cleans all active indicators.
  void logCleanAllActiveIndicator();

  /// Log when user clicks on indicator type.
  void logAddIndicatorByClickIndicatorType(
    String indicatorTitle,
    String categoryName,
  );

  /// Log when user clicks on indicator info Add button.
  void logAddIndicatorByClickAddOnIndicatorInfo(
    String indicatorTitle,
    String categoryName,
  );

  /// Log when user clicks on indicator info.
  void logClickIndicatorInfo(
    String indicatorTypeName,
    String categoryName,
  );

  /// Log when user deletes active indicator.
  void logDeleteActiveIndicator(
    String indicatorTitle,
    String categoryName,
  );

  /// Log when user deletes active indicator from indicator's settings.
  void logDeleteActiveIndicatorFromSettings(
    String indicatorTitle,
    String categoryName,
  );

  /// Log when user edits indicator settings.
  void logEditIndicatorSettings(
    String indicatorTitle,
    String categoryName,
  );

  /// Log when user resets indicator settings.
  void logResetIndicatorSettings(
    String indicatorTypeName,
    String categoryName,
  );

  /// Log when user opens indicator info from indicators list.
  void logOpenIndicatorInfoFromIndicatorsList(
    String indicatorTypeName,
    String categoryName,
  );

  /// Log when user opens indicator info from indicator settings.
  void logOpenIndicatorInfoFromIndicatorSettings(
    String indicatorTypeName,
    String categoryName,
  );

  /// Log when user closes indicator info.
  void logCloseIndicatorInfo(
    String indicatorTypeName,
    String categoryName,
  );
}
