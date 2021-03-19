import 'package:flutter/services.dart';

/// This class create a method channel to retrieve RudderStack write key for
/// Android and iOS
class RudderStack {
  static const MethodChannel _channel = MethodChannel('com.deriv.analytics');

  String _writeKey;

  /// RudderStack write key.
  String get writeKey => _writeKey;

  /// Retrieves rudder write key from the platform.
  Future<void> fetchWriteKey() async {
    String result;
    try {
      result = await _channel.invokeMethod('getWriteKey');
      _writeKey = result;
    } on PlatformException catch (error) {
      result = "Failed to get rudder write key: '${error.message}'.";
    }
  }
}
