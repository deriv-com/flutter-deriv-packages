import 'package:flutter/material.dart';

/// Holds device physical information.
class DeviceInfo {
  /// device safe area padding.
  static EdgeInsets? devicePadding;

  /// Device has notch.
  static bool hasTopNotch = false;

  /// base notch value
  /// For iOS it's 20 and for Android is 24. 24 can be used for both.
  static const double _baseNotchValue = 24;

  /// initializes [DeviceInfo] properties.
  static void init(BuildContext context) {
    DeviceInfo.devicePadding = MediaQuery.of(context).padding;
    DeviceInfo.hasTopNotch =
        (DeviceInfo.devicePadding?.top ?? 0) > _baseNotchValue;
  }
}
