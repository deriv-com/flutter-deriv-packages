import 'package:deriv_store_launcher/deriv_store_launcher.dart';
import 'package:deriv_store_launcher/platform_checker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/// The main app widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'App Launcher Example App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      );
}

/// The home page widget.
class MyHomePage extends StatelessWidget {
  static const String _dp2pPackageName = 'com.deriv.dp2p';
  static const String _dp2pUrlScheme = 'deriv://';
  static const String _dp2pAppStoreId = '1506901451';

  static const String _derivXPackageName = 'com.deriv.dx';
  static const String _derivXUrlScheme = 'derivx://';
  static const String _derivXAppStoreId = '1563337503';

  static const String _mt5PackageName = 'net.metaquotes.metatrader5';
  static const String _mt5UrlScheme = 'metatrader-5://';
  static const String _mt5AppStoreId = '413251709';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('App Launcher Example App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => _openApp(
                  context,
                  packageName: _dp2pPackageName,
                  urlScheme: _dp2pUrlScheme,
                  appStoreId: _dp2pAppStoreId,
                  openStore: false,
                ),
                child: const Text('Open DP2P'),
              ),
              ElevatedButton(
                onPressed: () => _openApp(
                  context,
                  packageName: _derivXPackageName,
                  urlScheme: _derivXUrlScheme,
                  appStoreId: _derivXAppStoreId,
                  openStore: true,
                ),
                child: const Text('Open DerivX'),
              ),
              ElevatedButton(
                onPressed: () => _openApp(
                  context,
                  packageName: _mt5PackageName,
                  urlScheme: _mt5UrlScheme,
                  appStoreId: _mt5AppStoreId,
                  openStore: true,
                ),
                child: const Text('Open MT5'),
              ),
              ElevatedButton(
                onPressed: () => _checkAppInstalled(
                  context,
                  packageName: _dp2pPackageName,
                  urlScheme: _dp2pUrlScheme,
                ),
                child: const Text('Check DP2P Installed'),
              ),
              ElevatedButton(
                onPressed: () => _checkAppInstalled(
                  context,
                  packageName: _derivXPackageName,
                  urlScheme: _derivXUrlScheme,
                ),
                child: const Text('Check DerivX Installed'),
              ),
              ElevatedButton(
                onPressed: () => _checkAppInstalled(
                  context,
                  packageName: _mt5PackageName,
                  urlScheme: _mt5UrlScheme,
                ),
                child: const Text('Check MT5 Installed'),
              ),
              ElevatedButton(
                onPressed: () => _openStoreListing(
                  packageName: _dp2pPackageName,
                  urlScheme: _dp2pUrlScheme,
                  appStoreId: _dp2pAppStoreId,
                ),
                child: const Text('Open DP2P in Store'),
              ),
              ElevatedButton(
                onPressed: () => _openStoreListing(
                  packageName: _derivXPackageName,
                  urlScheme: _derivXUrlScheme,
                  appStoreId: _derivXAppStoreId,
                ),
                child: const Text('Open DerivX in Store'),
              ),
              ElevatedButton(
                onPressed: () => _openStoreListing(
                  packageName: _mt5PackageName,
                  urlScheme: _mt5UrlScheme,
                  appStoreId: _mt5AppStoreId,
                ),
                child: const Text('Open MT5 in Store'),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.grey[200],
          child: Text(
            'Platform detected: [${PlatformChecker().isIOS ? 'iOS' : 'Android'}'
            ']',
          ),
        ),
      );

  void _showSnackbar(BuildContext context, {required String message}) {
    final SnackBar snackBar = SnackBar(content: Text(message));

    // Show the Snackbar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _openApp(
    BuildContext context, {
    required String packageName,
    required String urlScheme,
    required String appStoreId,
    required bool openStore,
  }) async {
    final bool isAppOpened = await DerivStoreLauncher.openApp(
      androidPackageName: packageName,
      iosUrlScheme: urlScheme,
      iosAppStoreId: appStoreId,
      openStore: openStore,
    );

    if (!isAppOpened) {
      String message = '';
      if (!openStore) {
        message = 'The app is not installed and configured to don\'t open the '
            'store.';
      } else {
        message = 'The app is not installed.';
      }

      _showSnackbar(context, message: message);
    }
  }

  Future<void> _checkAppInstalled(
    BuildContext context, {
    required String packageName,
    required String urlScheme,
  }) async {
    final bool? isAppInstalled = await DerivStoreLauncher.isAppInstalled(
      androidPackageName: packageName,
      iosUrlScheme: urlScheme,
    );

    if (isAppInstalled != null) {
      _showSnackbar(context,
          message: '${urlScheme.split("://")[0]} is '
              '${isAppInstalled ? 'installed' : 'not installed'}');
    }
  }

  Future<void> _openStoreListing({
    required String packageName,
    required String urlScheme,
    required String appStoreId,
  }) async {
    await DerivStoreLauncher.openStoreListing(
      androidPackageName: packageName,
      iosUrlScheme: urlScheme,
      iosAppStoreId: appStoreId,
    );
  }
}
