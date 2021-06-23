import 'dart:async';

import 'package:flutter/services.dart';

/// Flutter install referer link
class FlutterInstallReferer {
  static const MethodChannel _channel =
      MethodChannel('flutter_install_referer');

  /// Install referer object
  static Future<Map<String, String>?> get installReferer async {
    final Map<String, String>? dataMap =
        await _channel.invokeMapMethod('installReferer');
    return dataMap;
  }
}
