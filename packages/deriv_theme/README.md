# Deriv Theme

A flutter package that contains the theme used by Deriv products.

## Getting Started

This package contains theme details associated with Deriv guidelines such as color codes, font families, font appearance & style, and dark/light theme control.

## Installation

In order to use the package, add the following to `pubspec.yaml` file. Refer to this [link](https://flutter.dev/docs/development/packages-and-plugins/using-packages) for more details.

```yaml
deriv_theme:
       git:
         url: git@github.com:regentmarkets/flutter-deriv-packages.git
         path: packages/deriv_theme
         ref: master
```

run `flutter pub get` from the command line. And import it;

## Usage

```dart
import 'package:deriv_theme/deriv_theme.dart';
```
Then, wrap your MaterialApp or CupertinoApp with DerivThemeProvider:

```dart
void main() {
  runApp(
    DerivThemeProvider(
      child: MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: MyHomePage(),
      ),
    ),
  );
}
```
To access the current theme, use the static DerivThemeProvider.getTheme method:

```dart
final theme = DerivThemeProvider.getTheme(context);
```
To change the theme, call the DerivThemeProvider.changeTheme method:

```dart
DerivThemeProvider.changeTheme(context, ThemeMode.dark);
```
