# Deriv Auth UI
This package contains the shared `Auth` UI for deriv apps. This was exctracted from `flutter-multipliers` and some modifications were made to make it more generic and flexible.

## Features:

- Provides basic layout for auth pages.
- Handles form validation.
- Handles state management for auth pages.

## Getting Started:

1. Add the package to your project:

``` yaml
dependencies:
   git:
      url: git@github.com:regentmarkets/flutter-deriv-packages.git
      path: packages/deriv_auth_ui
      ref: dev
```

2. Import the package:

``` dart
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
```

3. Wrap your MaterialApp with `DerivThemeProvider`:

```dart
DerivThemeProvider.builder(
        initialTheme: ThemeMode.dark,
        builder: (context) => MaterialApp(
          /// ...
        ),
      ),
```

4. In your MaterialApp add the `DerivAuthUILocalization` delegate:

```dart
MaterialApp(
  localizationsDelegates: [
    DerivAuthUILocalization.delegate,
    /// ... more localization delegates
  ],
)
```

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

## Layouts provided:

### - Get Started Flow
- **Get Started Layout**
    ``` dart
      DerivGetStartedLayout(
        slides: [
            // List of instances of DerivGetStartedSlideModel
        ],
        appLogoIconPath: appLogoIconPath,
        backgroundImagePath: backgroundImagePath,
        onLoginTapped: () {},
        onSignupTapped: () {},
        onTapNavigation: (){
          // Callback to be called when pressed on the screen seven times
        },
      );
    ```
### - Login Flow
- **Login Layout**
    ``` dart
      DerivLoginLayout(
            welcomeLabel: 'Welcome back!',
            greetingLabel:
              'Log in to your Deriv account to start trading and investing.',
            authErrorStateHandler: AuthErrorStateHandler(context: context),
            onResetPassTapped: () {
                // Navigate to reset password page
            },
            onSignupTapped: () {
                // Navigate to signup page
            },
            onLoginError: (DerivAuthErrorState error) {
                // Show error message
            },
            onLoggedIn: (DerivAuthLoggedInState state) {
                // Navigate to home page
            },
            onSocialAuthButtonPressed: (SocialAuthProvider provider) {
                // Handle social auth
            },
          );
    ```
- **2FA Layout**
    ``` dart
      Deriv2FALayout(
            email: email,
            password: password,
          );
    ```

### - Signup Flow
- **Signup Layout**
    ``` dart
      DerivSignupLayout(
            signupPageLabel: 'Start trading with Deriv',
            authErrorStateHandler: AuthErrorStateHandler(context: context),
            signupPageDescription:
              'Join over 1 million traders worldwide who loves trading at Deriv.',
            onSocialAuthButtonPressed: (SocialAuthProvider provider) {},
            onSingupError: (DerivSignupErrorState error) {},
            onSingupEmailSent: (String email) {},
            onSignupPressed: () {},
            onLoginTapped: () {},
          );
    ```
- **Verify Email Layout**
    ``` dart
      DerivVerifyEmailLayout(
        email: email,
        onEmailNotReceivedPressed: () {},
      );
    ```
- **Email not received layout**
    ``` dart
      DerivEmailNotReceivedLayout(
        onReEnterEmailPressed: () {},
      );
    ```
- **Verification Done Layout**
    ``` dart
     DerivVerificationDoneLayout(
        verificationCode: '123456',
        onContinuePressed: () {},
      );
    ```
- **Country Selection Layout**
    ``` dart
     DerivCountrySelectionLayout(
        onNextPressed: () {},
        verificationCode: '123456',
        residences: residences,
      );
    ```
- **Set Password Layout**
    ``` dart
     DerivSetPasswordLayout(
            onDerivAuthState: (BuildContext, DerivAuthState) {},
            authErrorStateHandler: AuthErrorStateHandler(context: context),
            onDerivSignupState: (BuildContext, DerivSignupState) {},
            onPreviousPressed: () {},
            verificationCode: '123456',
            residence: 'residence',
          );
    ```
### - Reset Password Flow

- **Reset Password Layout**
    ``` dart
     DerivResetPassLayout(
          onResetPassError: (String? error) {},
        ),
    ```

- **Choose New Password Layout**
    ``` dart
     DerivChooseNewPassLayout(
          onResetPassError: (String? error) {},
          onResetPassSucceed: () {},
          token: token,
        ),
    ```

- **Reset Password Success Layout**
    ``` dart
     DerivSuccessPassChangeLayout();
    ```


## Additional:

### AuthListener

`AuthListener` is a widget that listens to the `DerivAuthCubit` state and calls the corresponding callback. This widget is created for ease of using `AuthErrorStateHandler` by handling the mapping of the error state to the corresponding method in the `AuthErrorStateHandler` class.


```dart
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

```