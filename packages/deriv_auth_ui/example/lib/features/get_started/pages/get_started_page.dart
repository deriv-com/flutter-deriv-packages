import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:example/features/login/pages/login_page.dart';
import 'package:example/features/settings/pages/settings_page.dart';
import 'package:example/features/signup/pages/signup_page.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) => DerivGetStartedLayout(
        slides: [
          DerivGetStartedSlideModel(
              imagePath: 'assets/images/charts.svg', supportingText: 'Charts'),
          DerivGetStartedSlideModel(
              imagePath: 'assets/images/live_chat.svg',
              supportingText: 'Live Chat'),
          DerivGetStartedSlideModel(
              imagePath: 'assets/images/markets.svg',
              supportingText: 'Markets'),
        ],
        appLogoIconPath: 'assets/images/ic_logo_extended.svg',
        backgroundImagePath: 'assets/images/triangles.svg',
        onLoginTapped: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        ),
        onSignupTapped: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SignupPage(),
          ),
        ),
        onTapNavigation: () {
          Navigator.push(
            context,
            MaterialPageRoute<Widget>(
              builder: (BuildContext context) => const SettingsPage(),
            ),
          );
        },
      );
}
