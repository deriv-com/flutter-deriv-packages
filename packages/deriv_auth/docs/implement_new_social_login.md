This document will give you the overview on how to implement new social login using   `deriv_auth` package.

### Step 1: Register social auth cubit
Register social auth cubit in your app cubit.

```dart
  BlocManager.instance.register(SocialAuthCubit(
      socialAuthService: DerivSocialAuthService(
        client: HttpClient(),
        connectionInfo: DerivAuthConnectionInfo(),
      ),
    ));
```

### Step 2: Get social auth providers

```dart
  final socialAuthCubit = BlocManager.instance.fetch<SocialAuthCubit>()
  socialAuthCubit.getSocialAuthProviders();
```

This will return list of `SocialAuthProviderModel` [google, apple, facebook]. If it is empty, you just continue with your previous one all social login and no need to follow the next steps. One all will be removed in the future, once new social login is stable and currently should only be used as fallback.

`SocialAuthProviderModel` has following properties:

```dart
  final String authUrl;
  final String codeChallenge;
  final String codeVerifier;
  final SocialAuthProvider name; // SocialAuthProvider.google, SocialAuthProvider.apple, SocialAuthProvider.facebook
  final String nonce;
  final String state;
```

### Step 3: Open webview based on the `SocialAuthProviderModel` selected.
Below is just an example and can be done in any way you want to handle the opening of web view.
```dart
ChromeSafariBrowser _browser = AppChromeSafariBrowser();

_browser.open(
  url: Uri.parse(socialAuthModel.authUrl),
  options: ChromeSafariBrowserClassOptions(
    android: AndroidChromeCustomTabsOptions(
      addDefaultShareMenuItem: false,
    ),
    ios: IOSSafariOptions(
      barCollapsingEnabled: true,
    ),
  ),
);
```

### Step 4: Handle the redirect url
Once the user has successfully logged in, the webview will redirect back to the app with redirect uri. You need to handle the redirect url and pass it to the `SocialAuthCubit` as `SocialAuthDto` to complete the login process.

Here's an example of what the redirect uri will look like for deriv go:
```
deriv://multipliers/oauth2/social-login/callback/app/27017?state=******code=********
```

To receive the redirect uri, you will need to setup to receive it. An example using `uni_links`:

```dart
void _setupLinkStream(Function(Uri) uriHandler) {
  _uriLinkStream = uriLinkStream.listen(
    (Uri? uri) {
      _uriLinkStream?.cancel();

      if (uri != null) {
        _closeBrowser();

        uriHandler(uri);
      }
    },
    onError: (dynamic error) async => _closeBrowser(),
  );
}
```

The `uriHandler` is the callback for what we do when we receive the redirect uri. In this case, we will pass it to the `SocialAuthCubit` as `SocialAuthDto` to complete the login process.

```dart
void uriHandler(Uri uri){
    /// Get callback state and code from the redirect uri
    final callbackState = uri.queryParameters['state'];
    final code = uri.queryParameters['code'];

    /// Create SocialAuthDto
    /// We will need to have access to the `SocialAuthProviderModel` that we used to open the webview.
    /// In this example, `socialAuthProvider` is the `SocialAuthProviderModel` that we used to open the webview.
    final SocialAuthDto socialAuthDto = SocialAuthDto(
        nonce: socialAuthProvider.nonce,
        state: socialAuthProvider.state,
        codeVerifier: socialAuthProvider.codeVerifier,
        code: code,
        callbackState: callbackState,
        provider: socialAuthProvider.name,
        );


    /// Pass the `SocialAuthDto` to the `SocialAuthCubit` to complete the login process.
    BlocManager.instance.fetch<DerivAuthCubit>().socialAuth(
            socialAuthDto: socialAuthDto,
            );
    /// Note: `socialAuth` method for new social login and `socialLogin` method for old social login.
}
```
### Step 5: Enjoy.