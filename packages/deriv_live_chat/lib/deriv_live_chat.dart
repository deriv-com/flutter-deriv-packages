import 'dart:async';

import 'package:flutter/services.dart';

/// Deriv live chat plugin.
class DerivLiveChat {
  static const MethodChannel _channel = MethodChannel('deriv_live_chat');

  ///live chat 3rd party activity
  static Future<void> startChat(String licenseNo,
      String groupId,
      String visitorName,
      String visitorEmail,
      [Map<String, String>? customParams]) async {

    final void chate = await _channel.invokeMethod('liveChat_activity',
        <String, dynamic>{
          'licenseNo': licenseNo,
          'groupId': groupId,
          'visitorName': visitorName,
          'visitorEmail': visitorEmail,
          'customParams': customParams,
        });
    return chate;
  }

  ///configure live chat view
  static Future<void> startChatView(String licenseNo,
      String groupId,
      String visitorName,
      String visitorEmail,
      [Map<String, String>? customParams]) async {
    final void chate = await _channel.invokeMethod('livechat_view',
        <String, dynamic>{
          'licenseNo': licenseNo,
          'groupId': groupId,
          'visitorName': visitorName,
          'visitorEmail': visitorEmail,
          'customParams': customParams,
        });
    return chate;
  }
}
