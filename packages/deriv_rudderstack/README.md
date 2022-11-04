# deriv_rudderstack

DerivRudderstack plugin is used to add RudderStack Android and iOS SDK support to Flutter. Through the plugin, various users' analaytical events could be logged.

### Supported methods

| Method       | Android | iOS |
| ------------ | ------- | --- |
| `identify`   | X       | X   |
| `track`      | X       | X   |
| `screen`     | X       | X   |
| `group`      | X       | X   |
| `alias`      | X       | X   |
| `reset`      | X       | X   |
| `disable`    | X       | X   |
| `enable`     | X       | X   |
| `setContext` | X       | X   |

## Installation

In order to use the plugin, add the following to `pubspec.yaml` file. Refer to this [link](https://flutter.dev/docs/development/packages-and-plugins/using-packages) for more details.

```yaml
deriv_rudderstack:
  git:
    url: git@github.com:regentmarkets/flutter-deriv-packages.git
    path: packages/deriv_rudderstack
    ref: master
```

Setup the Android and iOS sources as described at rudderstack.com and generate the write keys for Android and iOS sources.

## Usage

The plugin can be used by making a call to one of the supported methods as follows:

```dart
DerivRudderstack().enable();

DerivRudderstack().setContext(token: 'your-push-token');
DerivRudderstack().identify(userId: 'user-id');

DerivRudderstack().track(
   eventName: 'Application Opened',
   properties: {'entry1': 'test1', 'entry2': 'test2'});

DerivRudderstack().screen(screenName: 'screen-name');

DerivRudderstack().group(
   groupId: 'group-id-test',
   traits: {'entry1': 'test1', 'entry2': 'test2'});

DerivRudderstack().alias(alias: 'alias-test');

DerivRudderstack().reset();

DerivRudderstack().disable();

```
