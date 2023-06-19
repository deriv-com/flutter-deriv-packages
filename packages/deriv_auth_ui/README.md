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

