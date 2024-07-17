import 'package:flutter/material.dart';
import 'package:update_checker/update_checker.dart';

/// UpdateCheckerPage
class UpdateCheckerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('UpdateChecker'),
        ),
        body: Builder(
          builder: (BuildContext context) => UpdateChecker(
            firebaseRepository: FirebaseRemoteConfigRepository(),
            onNotAvailable: () => _showSnackBar(
              context,
              'Update not available',
            ),
            onAvailable: (_) => _showSnackBar(
              context,
              'Update available!',
            ),
            child: const Center(
              child: Text('The result will be shown in the snack bar'),
            ),
          ),
        ),
      );

  void _showSnackBar(BuildContext context, String message) =>
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
}
