import 'package:deriv_localizations/l10n/generated/deriv_auth/deriv_auth_localizations.dart';
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
          DerivAuthLocalizations.delegate
        ],
        home: child,
      );
}
