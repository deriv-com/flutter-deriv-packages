## Deriv Auth Layouts

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
            welcomeLabel: 'Welcome back!',
            greetingLabel:
              'Log in to your Deriv account to start trading and investing.',
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
            onSocialAuthButtonPressed: (SocialAuthDto socialAuthDto) {
                // Get access to dto from social auth to be used 
                // for navigating to 2FA page
            },
            socialAuthStateHandler: (SocialAuthState state) {
                // Handle social auth state
            },
          );
    ```
- **2FA Layout**
    ``` dart
    // For 2FA with email and password
      Deriv2FALayout.systemLogin(
            email: email,
            password: password,
          );
    // For 2FA with social auth
        Deriv2FALayout.socialLogin(
                socialAuthDto: socialAuthDto,
            );
    ```

### - Signup Flow
- **Signup Layout**
    ``` dart
      DerivSignupLayout(
            signupPageLabel: 'Start trading with Deriv',
            signupPageDescription:
              'Join over 1 million traders worldwide who loves trading at Deriv.',
            onSocialAuthButtonPressed: (SocialAuthProvider provider) {},
            onSingupError: (DerivSignupErrorState error) {},
            onSingupEmailSent: (String email) {},
            onSignupPressed: () {},
            onLoginTapped: () {},
            socialAuthStateHandler: (SocialAuthState state) {
                // Handle social auth state
            },
            onSocialAuthButtonPressed: (SocialAuthDto socialAuthDto) {
                // Get access to dto from social auth to be used 
                // for navigating to 2FA page
            },
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
          onResetPassError: ({required bool isLinkExpired, String? error}) {},
          onResetPassSucceed: () {},
          token: token,
        ),
    ```

