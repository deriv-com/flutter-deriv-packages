# update_checker

A helper package that checks and retrieves version update information from the server for the given package.

---

## Getting Started

The plugin uses `Firebase Database` which needs to be updated manually or through automation whenever there is a new release.

### Data structure

```yaml
build:
  android:
    optional:
      buildnumber: 24
      changelog: 'RFAyUCB2ZXJ....' // Base64
      url: 'https://alternative.app.link'
    mandatory:
      buildnumber: 18
      changelog: 'RFAyUCB2ZXJ....' // Base64
      url: 'https://alternative.app.link'
```


### Update types

`Optional`: Can be dismissed and continue using old version.

`Mandatory`: Will block the usage of app unless user updates.

---

## Installation

1. Open `pubspec.yaml`, and add the `update_checker` dependency:

```yaml
update_checker:
  git:
    url: https://github.com/deriv-com/flutter-deriv-packages.git
    path: packages/update_checker
    ref: master
```

2. Run `flutter pub get` in the terminal, or click **Packages get** in IntelliJ or Android Studio.

**Refer to this [link](https://flutter.dev/docs/development/packages-and-plugins/using-packages#dependencies-on-unpublished-packages) for more details.*

---

## Example

You can use the `update_checker` package in two ways, One is to use pure bloc in your code and listen to states and dispatch events to the `UpdateBloc` or you can simply use the `UpdateChecker` helper widget and just implement your logic for each callback you need without dealing with bloc itself.
### UpdateBloc

You can import the `UpdateBloc`, `UpdateXEvent` and `UpdateXState` from the package and use them as a normal bloc through your code. Make sure you will provide the `UpdateBloc` with `BlocProvider` before using it.

```dart
// main.dart
import 'package:flutter/material.dart';

import 'example_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      MaterialApp(title: 'Example', home: ExamplePage());
}


// example_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:update_checker/update_checker.dart';

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocProvider<UpdateBloc>(
          create: (_) => UpdateBloc()..add(UpdateFetchEvent()),
          child: BlocBuilder<UpdateBloc, UpdateState>(
            builder: (_, UpdateState state) => Center(
              child: Text('${state.runtimeType}'),
            ),
          ),
        ),
      );
}
```

### UpdateChecker

If you don't need complex logic then you can just import `UpdateChecker` widget from the package and simply use its callback. Make sure you will provide the `UpdateBloc` with `BlocProvider` before using it. Note that you can also use the `UpdateCheckerProvider` widget to provide the bloc.

```dart
// main.dart
import 'package:flutter/material.dart';

import 'example_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      MaterialApp(title: 'Example', home: ExamplePage());
}


// example_page.dart
import 'package:flutter/material.dart';
import 'package:update_checker/update_checker.dart';

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  UpdateState state;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: UpdateCheckerProvider(
          UpdateChecker(
            onStateChange: (UpdateState state) => setState(() {
              this.state = state;
            }),
            child: Center(child: Text('${state.runtimeType}')),
          ),
        ),
      );
}
```