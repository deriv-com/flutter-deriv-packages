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
      );
    ```
### - Login Flow
- **Login Layout**
    ``` dart
      DerivLoginLayout(
            authCubit: authCubit,
            onResetPassTapped: () {
                // Navigate to reset password page
            },
            onSignupTapped: () {
                // Navigate to signup page
            },
            onLoginError: (_) {
                // Show error message
            },
            onLoggedIn: (_) {
                // Navigate to home page
            },
            onSocialAuthButtonPressed: (_) {
                // Handle social auth
            },
          );
    ```
- **2FA Layout**
    ``` dart
      Deriv2FALayout(
            authCubit: authCubit,
            email: email,
            password: password,
          );
    ```

### - Signup Flow
- **Signup Layout**
    ``` dart
      DerivSignupLayout(
            signupCubit: signupCubit,
            onSocialAuthButtonPressed: (_) {},
            onSingupError: (_) {},
            onSingupEmailSent: (_) {},
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
            authCubit: authCubit,
            signupCubit: signupCubit,
            onDerivAuthState: (_, __) {},
            onDerivSignupState: (_, __) {},
            onPreviousPressed: () {},
            verificationCode: '123456',
            residence: 'residence',
          );
    ```
### - Reset Password Flow

- **Reset Password Layout**
    ``` dart
     DerivResetPassLayout(
          cubit: mockResetPassCubit,
          onResetPassError: (String? error) {},
        ),
    ```

- **Choose New Password Layout**
    ``` dart
     DerivChooseNewPassLayout(
          resetPassCubit: mockResetPassCubit,
          onResetPassError: (String? error) {},
          onResetPassSucceed: () {},
          token: token,
        ),
    ```

