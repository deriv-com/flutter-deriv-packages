import 'dart:developer' as logger;
import 'package:deriv_auth/deriv_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) => const DerivSettingLayout(
        appLabel: 'appLabel',
        saveValues: _saveValues,
        updateFlavorConfigs: _updateFlavorConfig,
      );
}

_saveValues({required String appId, required String endpoint}) {
  logger.log('appId is $appId');
  logger.log('endpoint is $endpoint');
}

Future<void> _updateFlavorConfig(
    {required String endpoint, required String appId}) async {
  logger.log('Flavor CONFIG is updated');
}
