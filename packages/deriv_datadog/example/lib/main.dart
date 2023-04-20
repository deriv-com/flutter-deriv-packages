import 'package:flutter/material.dart';

import 'package:deriv_datadog/deriv_datadog.dart';

import 'package:example/pages/first_page.dart';
import 'package:example/pages/second_page.dart';
import 'package:example/pages/splash_screen.dart';

Future<void> main() async {
  const configuration = DerivDatadogConfiguration(
    clientToken: 'pub94b3b84bd1d14eb99088ea90fc461406',
    env: 'example',
    site: DatadogSite.us1,
    trackingConsent: TrackingConsent.granted,
    applicationId: '4a49b761-1bf2-40c2-94d4-9c044503f0fd',
    nativeCrashReportEnabled: true,
    sessionSamplingRate: 10,
    tracingSamplingRate: 1,
    serviceName: 'deriv.com',
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
