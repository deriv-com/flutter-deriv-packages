## AuthErrorHandler

Since `DerivAuthCubit` influences many features like - login, signup, change password, etc. To be ease the error handling by making it needed to implement in only one place and to make sure all the auth error cases has been handled we have created a base class which client app can extend if they want changes in the default error handling.

```dart
base class AuthErrorStateHandler {
  /// {@macro default_auth_error_state_handler}
  AuthErrorStateHandler({
    required this.context,
  });

  /// The [BuildContext] of the widget that is using this handler.
  final BuildContext context;

  /// On invalid 2FA code.
  void invalid2faCode(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.localization.informInvalid2FACode,
      actionLabel: context.localization.actionTryAgain,
    );
  }

  /// On invalid email or password.
  void invalidEmailOrPassword(DerivAuthErrorState state) {
   //....
  }

  // ...
}
```
If client app wants to customize the error handling they can extend the `AuthErrorStateHandler` and override the methods they want to customize.

```dart

final class CustomAuthErrorStateHandler extends AuthErrorStateHandler {
  CustomAuthErrorStateHandler({
    required BuildContext context,
  }) : super(context: context);

  @override
  void invalid2faCode(DerivAuthErrorState state) {
    //...
  }
}
```
The client app can pass the custom error handler to the layout's constructor.

```dart
DerivLoginLayout(
  // ...
  authErrorStateHandler: CustomAuthErrorStateHandler(context: context),
  // ...
)
```
The package handles the mapping of the error state to the corresponding method in the `AuthErrorStateHandler` class within the layout.
