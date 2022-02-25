import 'package:flutter/material.dart';

/// Holds device physical information.
class DeviceInfo {
  /// device safe area padding.
  static EdgeInsets? devicePadding;

  /// initializes [DeviceInfo] properties.
  static void init(BuildContext context) =>
      DeviceInfo.devicePadding = MediaQuery.of(context).padding;
}
