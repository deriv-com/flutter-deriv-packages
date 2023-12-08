import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:flutter/material.dart';

final class ExampleAuthErrorStateHandler extends AuthErrorStateHandler {
  ExampleAuthErrorStateHandler({required super.context});

  @override
  void onInvalidCredentials(DerivAuthErrorState state) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(state.message),
      ),
    );
  }
}
