import 'dart:io';

import 'package:device_apps/device_apps.dart';

import 'package:deriv_store_launcher/deriv_store_launcher.dart';

/// Dp2p Application Id.
const String dp2pApplicationId = 'com.deriv.dp2p';

/// Checks if Dp2p app is installed on the device.
///
/// We can check app availability only in android.
Future<bool> get isDp2pInstalled async =>
    Platform.isAndroid && await DeviceApps.isAppInstalled(dp2pApplicationId);

/// Lunches Dp2p app.
Future<void> lunchDp2pApp() async => DeviceApps.openApp(dp2pApplicationId);

/// Opens Dp2p app in Apple or Google Play store.
Future<void> openStore() async {
  final String appId = Platform.isAndroid ? 'com.deriv.dp2p' : '1506901451';

  await DerivStoreLauncher.openWithStore(appId);
}
