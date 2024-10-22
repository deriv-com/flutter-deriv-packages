import 'dart:async';

import 'package:flutter/services.dart';

/// Deriv live chat plugin.
class DerivLiveChat {
  static const MethodChannel _liveChatMethodChannel =
      MethodChannel('deriv_live_chat');

  static const EventChannel _liveChatEventChannel =
      EventChannel('deriv_live_chat_event_listener');

  /// Start chat by invoking method channel.
  static Future<void> openChatView({
    required String licenseId,
    required String username,
    required String email,
    String? groupId,
    Map<String, String>? customParameters,
  }) async =>
      _liveChatMethodChannel.invokeMethod<dynamic>(
        'open_live_chat_view',
        <String, dynamic>{
          'licenseId': licenseId,
          'visitorName': username,
          'visitorEmail': email,
          'groupId': groupId,
          'customParams': customParameters,
        },
      );

  /// Close chat window by invoking method channel.
  static Future<void> closeChatView() async =>
      _liveChatMethodChannel.invokeMethod<dynamic>('close_live_chat_view');

  /// Clear chat history by invoking method channel.
  static Future<void> clearChatView() async =>
      _liveChatMethodChannel.invokeMethod<dynamic>('clear_live_chat_view');

  /// Reload chat window by invoking method channel.
  static Future<void> reloadChatView() async =>
      _liveChatMethodChannel.invokeMethod<dynamic>('reload_live_chat_view');

  /// Here we are receiving events stream.
  static Stream<dynamic>? get onEventReceived =>
      _liveChatEventChannel.receiveBroadcastStream();
}
