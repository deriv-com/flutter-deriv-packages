import 'dart:async';
import 'package:flutter/services.dart';

/// Deriv live chat plugin.
class DerivLiveChat {
  static const MethodChannel _channel = MethodChannel('derivLiveChat');
  static const EventChannel _eventChannelListner =
      EventChannel('derivLiveChatListner');

  /// Start chat by invoking method channel.
  static Future<void> startChatView(String licenseNo, String groupId,
          String visitorName, String visitorEmail,
          [Map<String, String>? customParams]) async =>
      _channel.invokeMethod<dynamic>('derivLiveChatView', <String, dynamic>{
        'licenseNo': licenseNo,
        'groupId': groupId,
        'visitorName': visitorName,
        'visitorEmail': visitorEmail,
        'customParams': customParams,
      });

  /// Here we are receving events stream.
  static Stream<dynamic>? get onEventRecieved =>
      _eventChannelListner.receiveBroadcastStream();
}
