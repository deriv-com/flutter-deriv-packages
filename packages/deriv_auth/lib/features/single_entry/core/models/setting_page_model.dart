import 'package:flutter/material.dart';

/// Setting page model
class SettingPageModel {
  /// Constructor [SettingPageModel]
  SettingPageModel({
    required this.appLabel,
    required this.appId,
    required this.endpoint,
    required this.saveValues,
    required this.updateFlavorConfigs,
    this.settingsPageNavigation,
    this.getAppEnv,
    this.setAppEnv,
    this.features,
  });

  /// Setting page App label
  final String appLabel;

  /// application id
  final String Function() appId;

  /// end point
  final String Function() endpoint;

  /// Save values to shared preferences
  final Function({required String endpoint, required String appId}) saveValues;

  /// Update flavor configurations
  final Function({required String endpoint, required String appId})
      updateFlavorConfigs;

  /// Settings page navigation
  final Function(BuildContext context)? settingsPageNavigation;

  /// Gets environment variable
  final Future<bool>? getAppEnv;

  /// Sets environment variable
  final Future<void> Function({required bool value})? setAppEnv;

  /// Feature flag widget that should be listed in the setting page.
  final Widget? features;
}
