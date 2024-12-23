# Deriv Passkeys

Deriv Passkeys is a Flutter plugin that allows you to generate passkeys for Deriv applications (based on WebAuthn).

## Features

This package contains everything you need to set up passkeys in your Deriv Flutter App:

* Android and iOS support
* Login with passkeys
* Create passkeys
* List passkeys

## Dependencies to Other Deriv Packages

* [flutter_deriv_api](https://github.com/deriv-com/flutter-deriv-api)
* [deriv_theme](https://github.com/regentmarkets/flutter-deriv-packages/tree/master/packages/deriv_theme)
* [deriv_ui](https://github.com/regentmarkets/flutter-deriv-packages/tree/master/packages/deriv_ui)

## Getting started

To use this package, add `deriv_passkeys` as a dependency in your pubspec.yaml file:

```yaml
dependencies:
  deriv_passkeys:
    git:
      url: https://github.com/deriv-com/flutter-deriv-packages.git
      path: packages/deriv_passkeys
      ref: deriv_passkeys-v0.0.1
```

### Android

No additional setup required.

### iOS

- Add the associated domains to your signing capabilities in Xcode:
- Add the following values to your associated domains:
  - webcredentials:deriv.com
  - applinks:deriv.com


## Usage

### Import the package

```dart
import 'package:deriv_passkeys/deriv_passkeys.dart';
```

### DerivPasskeysBloc:

```dart
    final DerivPasskeysBloc derivPasskeysBloc = DerivPasskeysBloc(
        getJwtToken: derivJwtService.getJwtToken,
        derivPasskeysService: DerivPasskeysService(
        DerivPasskeysRepository(
            DerivPasskeysDataSource(
            DerivPasskeysMapper(),
                ),
            ),
        ),
        connectionInfo: PasskeysConnectionInfoEntity(
        appId: FlavorConfig.instance.flavorValues.appId!,
        endpoint: FlavorConfig.instance.flavorValues.endPoint!,
            ),
    );
```

### ContinueWithPasskeyButton

```dart
    ContinueWithPasskeyButton(
        derivPasskeysBloc: context.read<DerivPasskeysBloc>(),
    ),
```

- This widget is used to continue with passkey.
- It requires `derivPasskeysBloc` as a parameter.
- It will return not show anything if the user's device does not support passkeys.
- When it's clicked it will either be successful or show an error message.
- in case of success the DerivPasskeysBloc will emit DerivPasskeysCredentialVerifiedState.
- The DerivPasskeysCredentialVerifiedState will contain the token which can be used to authenticate the user.
    ```dart
    DerivPasskeysCredentialVerifiedState(
            token: token,
          ),
    ```



    


