import 'dart:async';

import 'package:flutter/services.dart';

/// A plugin to lunch app stores.
class DerivStoreLauncher {
  static const MethodChannel _channel = MethodChannel('deriv_store_launcher');

  /// Launches the app store for the given [appId].
  static Future<void> openWithStore(String appId) async => _channel
      .invokeMethod<void>('openStore', <String, String>{'app_id': appId});
}
