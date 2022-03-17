import 'dart:async';
import 'package:flutter/services.dart';

/// Deriv live chat plugin.
class DerivLiveChat {

  static const MethodChannel _channel = MethodChannel('derivLiveChat');
  static const EventChannel _eventChannel = EventChannel('derivLiveChatStream');

  ///configure live chat view
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

  /// Here receving message stream
  static Stream<dynamic>? get onMessageRecieved =>
      _eventChannel.receiveBroadcastStream();
}
