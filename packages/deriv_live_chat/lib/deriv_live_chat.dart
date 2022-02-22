import 'dart:async';

import 'package:flutter/services.dart';

/// Deriv live chat plugin.
class DerivLiveChat {
  static const MethodChannel _channel = MethodChannel('deriv_live_chat');

  /// Begin chat by invoking method channel
  static Future<void> beginChat(
      String licenseNo, String groupId, String visitorName, String visitorEmail,
      [Map<String, String>? customParams]) async {
    await _channel.invokeMethod<void>('beginChat', <String, dynamic>{
      'licenseNo': licenseNo,
      'groupId': groupId,
      'visitorName': visitorName,
      'visitorEmail': visitorEmail,
      'customParams': customParams,
    });
  }
}
