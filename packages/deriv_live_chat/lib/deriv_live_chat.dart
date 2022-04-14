import 'dart:async';

import 'package:flutter/services.dart';

/// Deriv live chat plugin.
class DerivLiveChat {
  static const MethodChannel _liveChatMethodChannel =
  MethodChannel('deriv_live_chat');
  static const EventChannel _liveChatEventChannel =
  EventChannel('deriv_live_chat_event_listener');

  /// Start chat by invoking method channel.
  static Future<void> startChatView(String licenseNo, String groupId,
      String visitorName, String visitorEmail,
      [Map<String, String>? customParams]) async =>
      _liveChatMethodChannel
          .invokeMethod<dynamic>('derivLiveChatView', <String, dynamic>{
        'licenseNo': licenseNo,
        'groupId': groupId,
        'visitorName': visitorName,
        'visitorEmail': visitorEmail,
        'customParams': customParams,
      });

  /// Here we are receving events stream.
  static Stream<dynamic>? get onEventRecieved =>
      _liveChatEventChannel.receiveBroadcastStream();
}
