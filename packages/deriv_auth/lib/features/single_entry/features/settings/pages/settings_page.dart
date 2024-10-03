import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth/features/single_entry/core/auth_data.dart';
import 'package:flutter/material.dart';

/// Setting page
class SettingsPage extends StatefulWidget {
  /// Constructor for setting page
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) => DerivSettingLayout(
        updateFlavorConfigs:
            AuthData().data.settingPageModel.updateFlavorConfigs,
        appLabel: AuthData().data.settingPageModel.appLabel,
        saveValues: AuthData().data.settingPageModel.saveValues,
        appId: AuthData().data.settingPageModel.appId.call(),
        endpoint: AuthData().data.settingPageModel.endpoint.call(),
        features: AuthData().data.settingPageModel.features,
        setAppEnv: AuthData().data.settingPageModel.setAppEnv,
        getAppEnv: AuthData().data.settingPageModel.getAppEnv,
      );
}
