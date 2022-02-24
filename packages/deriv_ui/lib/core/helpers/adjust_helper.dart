import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_event.dart';

/// Tracks an Adjust event
///
/// [eventToken] : token of the event wanted to be sent to adjust.
///
/// [callbackParameters] : a map of parameters to be added as a callback
void trackAdjustEvent(
  String eventToken, {
  Map<String, String>? callbackParameters,
}) {
  final AdjustEvent adjustEvent = AdjustEvent(eventToken);

  if (callbackParameters != null) {
    callbackParameters.forEach(
      (String key, String value) =>
          adjustEvent.addCallbackParameter(key, value),
    );
  }

  Adjust.trackEvent(adjustEvent);
}
