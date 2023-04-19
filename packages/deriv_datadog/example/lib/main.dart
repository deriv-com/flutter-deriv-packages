import 'package:deriv_datadog/datadog.dart';
import 'package:example/pages/first_page.dart';
import 'package:example/pages/second_page.dart';
import 'package:example/pages/splash_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  const configuration = DatadogSdkConfig(
    clientToken: 'pub40512f28ffce322f0c2f4a7b4dda3b88',
    trackingConsent: MyTrackingConsent.granted,
    applicationId: '9665e0a3-4500-4ca2-b1db-34400682cf58',
  );

  DerivDatadogSDK().runApp(configuration,() {
    runApp(const MyApp());
  },
  
  );
}

class MyApp extends StatefulWidget {
   const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  DatadogSdk datadogSdk = DatadogSdk.instance;



  @override
  void initState() {
    super.initState();

    datadogSdk.setUserInfo(
        id: "0",
        name: "Example App User",
        email: "example@deriv.com",
      extraInfo: {

      }
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(



      navigatorObservers: [
        DerivDatadogSDK().navigationObserver
      ],

      initialRoute: '/splash_screen',
      routes: {
        '/splash_screen': (context) =>  const SplashScreen(),
        '/': (context) =>  const FirstPage(),
        '/second': (context) =>  const SecondPage(),
      },
    );
  }
}
