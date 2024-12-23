# deriv_live_chat

A plugin for live chat SDK support to dart.

## Quick Start

We have integrated LiveChat SDK in our Flutter applications to implement a real-time chatting feature easily and efficiently. However, LiveChat does not provide a plugin for Flutter, hence, we built one that contains the set of features needed for our apps, both Android and iOS.

The plugin consists of Android-related code written in Kotlin, and iOS-related written in Swift in which are called from Flutter/Dart through a method channel as a way of communication between Flutter framework and the native code.

## Getting Started

In order to start using the plugin, follow the step-by-step instructions below.

Step 1: Make sure you have a LiveChat Application Dashboard (create one if needed) This step is necessary to obtain the Licence ID which is used to initialize LiveChat Widget.
Create Account - https://developers.livechat.com

Step 2: Change Chat widget theme according to App layout. Option available in LiveChat Application Dashboard under setting section.

## Installation

In order to use the plugin, add the following to `pubspec.yaml` file. Refer to this [link](https://flutter.dev/docs/development/packages-and-plugins/using-packages) for more details.

```yaml
deriv_live_chat:
  git:
    url: git@github.com:deriv-com/flutter-deriv-packages.git
    path: packages/deriv_live_chat
    ref: master
```

```dart
import 'package:deriv_live_chat/deriv_live_chat.dart';
```

## Usage

The plugin can be used by simply making a call to as follows:

```dart
 DerivLiveChat.startChatView(
    licenseNo: '12345678', // set your licence number (get from Live chat App dashboard).
    name: 'Username', // you can provide customer name so a customer will not need to fill out the pre-chat survey.
    email: 'User email', // you can provide customer email so a customer will not need to fill out the pre-chat survey.
    groupId: '****', // group ID Optionally, You can route your customers group id.
    customParameters: <String, String>{ // optional parameters.
      'Appid': 'Demo',
      'udid': 'User'
    }
);
```

Receive InApp Notification Count when chat minimized.

```dart
final StreamSubscription? subscription;

int _unreadNotificationCounter = 0;

subscription = DerivLiveChat.onEventReceived?.listen((event) {
  if (event != 'chatOpen' && event != 'chatClose') {
    _setCounter(_unreadNotificationCounter++);
  }
});
```

## Compatibility

- Android: the plugin requires a minimum API level of 21 and Kotlin 1.4.0.
- iOS: The minimum iOS version supported is 11.

## Issues with LiveChat SDKs

- Push Notification is not working when app in background Mode and Terminated.
- Loading time to open a Chat can be long.
