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
}
