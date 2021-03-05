import 'package:flutter/services.dart';

/// This class create a method channel to retrieve data from Native Android and
/// iOS.
class PlatformData {
  static const MethodChannel _channel = MethodChannel('com.deriv.dp2p');

  String _writeKey;

  /// RudderStack write key.
  String get writeKey => _writeKey;

  /// Retrieves rudder write key from the platform.
  Future<void> fetchRudderWriteKey() async {
    String result;
    try {
      result = await _channel.invokeMethod('getWriteKey');
      _writeKey = result;
    } on PlatformException catch (error) {
      result = "Failed to get rudder write key: '${error.message}'.";
    }
  }
}
