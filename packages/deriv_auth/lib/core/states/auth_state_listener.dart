import 'package:deriv_auth/deriv_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template auth_state_listener}
/// A [Widget] that listens to the [DerivAuthCubit] state changes.
/// This was created to make it easier to use [AuthErrorStateHandler] by
/// handling the mapping of auth error states with [AuthErrorStateHandler]'s method'.
/// {@endtemplate}
class DerivAuthStateListener extends StatelessWidget {
  /// {@macro auth_state_listener}
  const DerivAuthStateListener({
    required this.child,
    super.key,
    this.onLoggedIn,
    this.onLoggedOut,
    this.onLoading,
    this.onError,
    this.authErrorStateHandler,
  });

  /// The [Widget] that is using this [DerivAuthStateListener].
  final Widget child;

  /// Callback to be called when user is logged in.
  final Function(DerivAuthLoggedInState)? onLoggedIn;

  /// Callback to be called when user is logged out.
  final VoidCallback? onLoggedOut;

  /// Callback to be called when user is logging in.
  final VoidCallback? onLoading;

  /// Callback to be called when an error occurs.
  final Function(DerivAuthErrorState)? onError;

  /// Extension of base [AuthErrorStateHandler]. If not provided, base implementation will be used.
  final AuthErrorStateHandler? authErrorStateHandler;

  @override
  Widget build(BuildContext context) =>
      BlocListener<DerivAuthCubit, DerivAuthState>(
        listener: (BuildContext context, DerivAuthState state) {
          if (state is DerivAuthLoggedInState) {
            onLoggedIn?.call(state);
          } else if (state is DerivAuthLoggedOutState) {
            onLoggedOut?.call();
          } else if (state is DerivAuthLoadingState) {
            onLoading?.call();
          } else if (state is DerivAuthErrorState) {
            onError?.call(state);

            authErrorStateMapper(
              authErrorState: state,
              authErrorStateHandler: authErrorStateHandler ??
                  AuthErrorStateHandler(context: context),
            );
          }
        },
        child: child,
      );
}
