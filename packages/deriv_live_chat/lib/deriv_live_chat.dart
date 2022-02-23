import 'dart:async';

import 'package:flutter/services.dart';

/// Deriv live chat plugin.
class DerivLiveChat {
  static const MethodChannel _channel = MethodChannel('deriv_live_chat');

  /// Gets platform version.
  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
  static Future<void> startChat(String licenseNo, String groupId, String visitorName, String visitorEmail,
      [Map<String, String>? customParams]) async {
    final void chate = await _channel.invokeMethod('liveChat', <String, dynamic>{
      'licenseNo': licenseNo,
      'groupId': groupId,
      'visitorName': visitorName,
      'visitorEmail': visitorEmail,
      'customParams': customParams,
    });
    return chate;
  }


}
