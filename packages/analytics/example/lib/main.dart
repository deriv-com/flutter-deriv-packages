import 'package:analytics/sdk/datadog/core/datadog_configuration.dart';
import 'package:analytics/sdk/datadog/core/enums.dart';
import 'package:analytics/sdk/datadog/sdk/deriv_datadog.dart';
import 'package:analytics/sdk/rudderstack/core/rudderstack_configuration.dart';
import 'package:analytics/sdk/rudderstack/sdk/deriv_rudderstack_sdk.dart';
import 'package:deriv_env/env.dart';
import 'package:example/pages/rudderstack.dart';
import 'package:flutter/material.dart';

import 'package:example/pages/first_page.dart';
import 'package:example/pages/second_page.dart';
import 'package:example/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Env().load();

  DerivDatadogConfiguration configuration = DerivDatadogConfiguration(
    applicationId: Env().get<String>(
      'DATADOG_APPLICATION_ID',
    ),
    clientToken: Env().get<String>(
      'DATADOG_CLIENT_TOKEN',
    ),
    env: Env().get<String>(
      'DATADOG_ENVIRONMENT',
    ),
    serviceName: Env().get<String>(
      'DATADOG_SERVICE_NAME',
    ),
    trackingConsent: TrackingConsent.granted,
  );

  DerivDatadog().setup(configuration);

  DerivRudderstack().setup(RudderstackConfiguration(
    dataPlaneUrl: Env().get<String>('RUDDERSTACK_DATA_PLANE_URL'),
    writeKey: Env().get<String>(
      'RUDDERSTACK_WRITE_KEY',
    ),
  ));

  runApp(const App());
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
        navigatorObservers: [DerivDatadog().navigatorObserver],
        initialRoute: '/splash_screen',
        routes: {
          '/splash_screen': (context) => const SplashScreen(),
          '/': (context) => const FirstPage(),
          '/second': (context) => const SecondPage(),
          '/rudderstack': (context) => const RudderStack(),
        },
      );
}
