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

/// Convert a list of integers to a string.
String convertBytesToString(List<int> input) => String.fromCharCodes(input);

/// Convert a 2D list of integers to a string.
String convert2DIntListToString(List<List<int>> list) {
  final StringBuffer string = StringBuffer();

  for (final List<int> row in list) {
    string.write(convertBytesToString(row));
  }

  return '$string';
}

/// Random auto-generated key.
const List<List<int>> key = <List<int>>[
  <int>[0x6a, 0x4b, 0x36, 0x78, 0x37, 0x48, 0x6e, 0x54],
  <int>[0x51, 0x46, 0x65, 0x69, 0x32, 0x38, 0x73, 0x55],
  <int>[0x63, 0x5a, 0x31, 0x6c, 0x4f, 0x79, 0x66, 0x44],
  <int>[0x6d, 0x52, 0x77, 0x62, 0x76, 0x7a, 0x45, 0x39],
];



void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Env().load();

  DerivDatadogConfiguration configuration = DerivDatadogConfiguration(
      applicationId: Env().get<String>(
        'DATADOG_APPLICATION_ID',
        decryptionKey: convert2DIntListToString(key),
      ),
      clientToken: Env().get<String>(
        'DATADOG_CLIENT_TOKEN',
        decryptionKey: convert2DIntListToString(key),
      ),
      env: Env().get<String>(
        'DATADOG_ENVIRONMENT',
        decryptionKey: convert2DIntListToString(key),
      ),
      serviceName: Env().get<String>(
        'DATADOG_SERVICE_NAME',
        decryptionKey: convert2DIntListToString(key),
      ),
      trackingConsent: TrackingConsent.granted,
    );

  DerivDatadog().setup(configuration);

  DerivRudderstack().setup(RudderstackConfiguration(
      dataPlaneUrl: Env().get<String>(
        'RUDDERSTACK_DATA_PLANE_URL',
        decryptionKey: convert2DIntListToString(key)
        ),
      writeKey: Env().get<String>(
        'RUDDERSTACK_WRITE_KEY',
        decryptionKey: convert2DIntListToString(key),
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
