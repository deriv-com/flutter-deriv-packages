import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:passkeys_poc/features/authentication/presentation/pages/landing_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (Platform.isIOS) {
        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => const LandingScreen()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LandingScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const CupertinoPageScaffold(
        child: Center(
          child: Image(
            image: NetworkImage("https://s3-eu-west-1.amazonaws.com/tpd/logos/5ed4c8a9f74f310001f51bf7/0x0.png"),
            fit: BoxFit.contain,
            height: 100,
          ),
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: Image(
            image: NetworkImage("https://s3-eu-west-1.amazonaws.com/tpd/logos/5ed4c8a9f74f310001f51bf7/0x0.png"),
            fit: BoxFit.contain,
            height: 100,
          ),
        ),
      );
    }
  }
}
