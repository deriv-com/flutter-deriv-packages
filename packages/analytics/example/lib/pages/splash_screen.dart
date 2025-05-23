import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushNamed(context, "/"),
    );
  }

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Hero(
              tag: "datadog_logo",
              child: Text(
                "Analytics Test App",
              ),
            ),
          ),
        ),
      );
}
