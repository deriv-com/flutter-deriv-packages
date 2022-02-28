import 'dart:async';

import 'package:flutter/services.dart';

/// Deriv live chat plugin.
class DerivLiveChat {

  static const MethodChannel _channel = MethodChannel('derivLiveChat');
  static const _eventChannel = EventChannel('derivLiveChatStream');

  ///configure live chat view
  static Future<void> startChatView(String licenseNo,
      String groupId,
      String visitorName,
      String visitorEmail,
      [Map<String, String>? customParams]) async => _channel.invokeMethod<dynamic>('livechat_view',
        <String, dynamic>{
          'licenseNo': licenseNo,
          'groupId': groupId,
          'visitorName': visitorName,
          'visitorEmail': visitorEmail,
          'customParams': customParams,
        });


  /// receive message
  static Stream<dynamic>? get onMessageReceive =>
      _eventChannel.receiveBroadcastStream();
}
