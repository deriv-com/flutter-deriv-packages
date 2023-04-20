import 'package:flutter/material.dart';

import 'package:deriv_datadog/deriv_datadog.dart';

import 'package:example/pages/first_page.dart';
import 'package:example/pages/second_page.dart';
import 'package:example/pages/splash_screen.dart';

Future<void> main() async {
  const configuration = DerivDatadogConfiguration(
    applicationId: 'APPLICAION_ID',
    clientToken: 'CLIENT_TOKEN',
    env: 'example',
    site: DatadogSite.us1,
    trackingConsent: TrackingConsent.granted,
    nativeCrashReportEnabled: true,
    sessionSamplingRate: 10,
    tracingSamplingRate: 1,
    serviceName: 'example',
  );

  DerivDatadog().runApp(configuration, () => runApp(const App()));
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();

    DerivDatadog().setUserInfo(
      id: "0",
      name: "Example App User",
      email: "example_user@deriv.com",
      extraInfo: {},
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorObservers: [DerivDatadog().navigationObserver],
        initialRoute: '/splash_screen',
        routes: {
          '/splash_screen': (context) => const SplashScreen(),
          '/': (context) => const FirstPage(),
          '/second': (context) => const SecondPage(),
        },
      );
}
