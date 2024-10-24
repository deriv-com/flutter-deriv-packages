# Deriv Store Launcher Flutter Plugin Documentation

## Table of Contents
- [Overview](#overview)
- [Installation](#installation)
    - [iOS Setup](#ios-setup)
    - [Android Setup](#android-setup)
- [Usage](#usage)
    - [Open Store Listing](#open-store-listing)
    - [Check if App is Installed](#check-if-app-is-installed)
    - [Open App or Redirect to Store](#open-app-or-redirect-to-store)
- [API Reference](#api-reference)
    - [openStoreListing](#openstorelisting)
    - [isAppInstalled](#isappinstalled)
    - [openApp](#openapp)
- [Platform Specific Configuration](#platform-specific-configuration)
    - [iOS Info.plist Configuration](#ios-infoplist-configuration)
    - [Android Manifest Configuration](#android-manifest-configuration)

---

## Overview

The `DerivStoreLauncher` Flutter plugin allows you to:
- Launch an app if it is installed on the device.
- Redirect the user to the appropriate App Store (Google Play or Apple App Store) if the desired app is not installed on the device.
- Check if a specific app is installed on the device.

This plugin supports **Android** and **iOS** platforms and assumes reasonable defaults for each platform.

---

## Installation

To use this plugin, it's necessary to add platform-specific configurations for both iOS and Android.

### iOS Setup

1. Open your `ios/Runner/Info.plist` file.
2. Add the `LSApplicationQueriesSchemes` key. This is required so that your app can query other installed apps on the device.

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>itms-apps</string>
    <string>derivx</string>
    <string>deriv</string>
    <string>metatrader-5</string>
</array>
```

### Android Setup

1. Open your `AndroidManifest.xml`.
2. Grant the necessary permissions to check installed apps by adding the following permission:

```xml
<uses-permission android:name="android.permission.QUERY_ALL_PACKAGES" />
```

> **Note:** This permission is required for checking if an app is installed on Android devices. Be mindful when submitting apps with this permission to the Google Play Store, as it may require extra justification.

---

## Usage

Import the `DerivStoreLauncher` package and start using its available functions.

```dart
import 'package:deriv_store_launcher/deriv_store_launcher.dart';
```

### Open Store Listing

This opens the respective app store (Google Play or iOS App Store), depending on the platform.

```dart
await DerivStoreLauncher.openStoreListing(
  androidPackageName: 'com.example.yourapp',
  iosAppStoreId: '123456789',
  iosUrlScheme: 'yourapp://',
);
```

### Check if App is Installed

Check if a specified app is installed using the iOS URL scheme or Android package name.

```dart
bool isInstalled = await DerivStoreLauncher.isAppInstalled(
  androidPackageName: 'com.example.yourapp',
  iosUrlScheme: 'yourapp://',
);
```

### Open App or Redirect to Store

Use this method to open an installed app directly. If the app is not installed, you can either redirect the user to the app store or handle it manually.

```dart
bool isAppOpened = await DerivStoreLauncher.openApp(
  androidPackageName: 'com.example.yourapp',
  iosUrlScheme: 'yourapp://',
  iosAppStoreId: '123456789',
  openStore: true, // Automatically redirects to store if app is not installed
);
```

---

## API Reference

### openStoreListing

Opens the app's store listing depending on the platform:

- **Google Play Store** for Android.
- **App Store** for iOS.

#### Parameters:
- `androidPackageName`: The package name of the Android app (e.g., `com.example.yourapp`).
- `iosAppStoreId`: The App Store ID for navigating to the iOS app store listing.
- `iosUrlScheme`: The URL scheme that identifies the app on iOS (e.g., `myapp://`).

#### Example:
```dart
await DerivStoreLauncher.openStoreListing(
  androidPackageName: 'com.example.yourapp',
  iosAppStoreId: '123456789',
  iosUrlScheme: 'yourapp://',
);
```

### isAppInstalled

Checks if the specified app is installed on the device:

- On Android, the `androidPackageName` is used.
- On iOS, the `iosUrlScheme` is used.

#### Parameters:
- `androidPackageName`: The package name of the Android app.
- `iosUrlScheme`: The custom URL scheme of the iOS app to check if installed.

#### Returns:
- A `Future<bool>` indicating whether the app is installed.

#### Example:
```dart
bool isInstalled = await DerivStoreLauncher.isAppInstalled(
  androidPackageName: 'com.example.yourapp',
  iosUrlScheme: 'yourapp://',
);
```

### openApp

Opens the app if it is installed, otherwise redirects to the app store listing if the `openStore` option is `true`.

#### Parameters:
- `androidPackageName`: The package name of the Android app.
- `iosUrlScheme`: The URL scheme of the iOS app.
- `iosAppStoreId`: The App Store ID for iOS, required if `openStore` is `true`.
- `openStore`: A boolean flag indicating whether to redirect to the store if the app isn’t installed. Default: `false`.

#### Returns:
- A `Future<bool>` indicating whether the app was opened successfully. If the app is not installed and the `openStore` flag is `true`, it opens the app store.

#### Example:
```dart
bool isAppOpened = await DerivStoreLauncher.openApp(
  androidPackageName: 'com.example.yourapp',
  iosUrlScheme: 'yourapp://',
  iosAppStoreId: '123456789',
  openStore: true,
);
```

---

## Platform Specific Configuration

### iOS Info.plist Configuration

To check for installed apps or open specific URL schemes on iOS, the `LSApplicationQueriesSchemes` key must be added in your **Info.plist**. This allows the system to query whether other apps are installed on the system.

Add the following lines in `Info.plist`:

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>itms-apps</string>
    <string>yourapp</string>
</array>
```

### Android Manifest Configuration

To check for installed apps on Android, you will need to grant the `QUERY_ALL_PACKAGES` permission in your **AndroidManifest.xml**. This allows your app to retrieve information about all installed apps on the device.

Add this to your `AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.QUERY_ALL_PACKAGES" />
```

This permission is necessary for your app to query external apps and invoke them; however, Google Play may require a specific declaration justifying your use of this permission. You may also need to test across Android 11+ devices for potential restrictions.

---

Now you're ready to use the `DerivStoreLauncher` in your Flutter project to open apps or store listings with ease. Happy coding! 🎉