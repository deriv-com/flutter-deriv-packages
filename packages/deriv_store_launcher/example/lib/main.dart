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
                  packageName: 'com.deriv.dp2p',
                  urlScheme: 'deriv://',
                  appStoreId: '1506901451',
                  openStore: true,
                ),
                child: const Text('Open DP2P'),
              ),
              ElevatedButton(
                onPressed: () => _openApp(
                  context,
                  packageName: 'com.deriv.dx',
                  urlScheme: 'derivx://',
                  appStoreId: '1563337503',
                  openStore: true,
                ),
                child: const Text('Open DerivX'),
              ),
              ElevatedButton(
                onPressed: () => _checkAppInstalled(
                  context,
                  packageName: 'com.deriv.dp2p',
                  urlScheme: 'deriv://',
                ),
                child: const Text('Check DP2P Installed'),
              ),
              ElevatedButton(
                onPressed: () => _checkAppInstalled(
                  context,
                  packageName: 'com.deriv.dx',
                  urlScheme: 'derivx://',
                ),
                child: const Text('Check DerivX Installed'),
              ),
              ElevatedButton(
                onPressed: () => _openStoreListing(
                  packageName: 'com.deriv.dp2p',
                  urlScheme: 'deriv://',
                  appStoreId: '1506901451',
                ),
                child: const Text('Open DP2P in Store'),
              ),
              ElevatedButton(
                onPressed: () => _openStoreListing(
                  packageName: 'com.deriv.dx',
                  urlScheme: 'derivx://',
                  appStoreId: '1563337503',
                ),
                child: const Text('Open DerivX in Store'),
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
