import 'package:deriv_auth_ui/generated/l10n.dart';
import 'package:flutter/material.dart';

class BaseTestApp extends StatelessWidget {
  const BaseTestApp({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) => MaterialApp(
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          DerivAuthUILocalization.delegate
        ],
        home: child,
      );
}
