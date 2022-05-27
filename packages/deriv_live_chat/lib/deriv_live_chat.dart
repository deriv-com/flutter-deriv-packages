import 'dart:async';

import 'package:flutter/services.dart';

/// Deriv live chat plugin.
class DerivLiveChat {
  static const MethodChannel _liveChatMethodChannel =
      MethodChannel('deriv_live_chat');

  static const EventChannel _liveChatEventChannel =
      EventChannel('deriv_live_chat_event_listener');

  /// Start chat by invoking method channel.
  static Future<void> startChatView({
    required String licenseId,
    required String username,
    required String email,
    String? groupId,
    Map<String, String>? customParameters,
  }) async =>
      _liveChatMethodChannel.invokeMethod<dynamic>(
        'derivLiveChatView',
        <String, dynamic>{
          'licenseId': licenseId,
          'visitorName': username,
          'visitorEmail': email,
          'groupId': groupId,
          'customParams': customParameters,
        },
      );

  /// Here we are receiving events stream.
  static Stream<dynamic>? get onEventReceived =>
      _liveChatEventChannel.receiveBroadcastStream();

  /// Start chat by invoking method channel.
  static Future<void> closeChatView() async =>
      _liveChatMethodChannel.invokeMethod<dynamic>('closeChatView');
}
