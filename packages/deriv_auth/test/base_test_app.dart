import 'package:deriv_auth/generated/l10n.dart';
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
          DerivAuthLocalization.delegate
        ],
        home: child,
      );
}
