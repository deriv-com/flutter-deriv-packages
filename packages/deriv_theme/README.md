# flutter_deriv_theme

A flutter package that contains the theme used by Deriv products.

## Getting Started

This package contains theme details associated with Deriv guidelines such as color codes, font families, font appearance & style, and dark/light theme control.

## Installation

In order to use the package, add the following to `pubspec.yaml` file. Refer to this [link](https://flutter.dev/docs/development/packages-and-plugins/using-packages) for more details.

```yaml
deriv_theme:
       git:
         url: git@github.com:deriv-com/flutter-deriv-packages.git
         path: packages/deriv_theme
         ref: master
```

run `flutter pub get` from the command line. And import it;

```dart
import 'package:deriv_theme/theme_provider.dart';
```

## Example

Add a style for a text. You can choose any style type provided, for the full list, see `text_styles.dart`

```dart
import 'package:deriv_theme/theme_provider.dart';
import 'package:flutter_deriv_theme/text_styles.dart';

Text(
   'Text',
   style: AppThemeProvider.of(context).textStyle(textStyle: TextStyles.display1),
)
```

Add a style for a text and specify a color. For the full list of colors, see `colors.dart`

```dart
import 'package:deriv_theme/theme_provider.dart';
import 'package:flutter_deriv_theme/text_styles.dart';

Text(
   'Text',
   style: AppThemeProvider.of(context).textStyle(
     textStyle: TextStyles.body2,
     color: _themeProvider.base05Color,
   ),
)
```

Theme provider package allows accessing dimensions values such as margins and border radius in different variations, for example;
```dart

// possible values: margin04, margin08, margin12, margin16, margin24, margin32, etc. See 'dimens.dart` for the full list.
margin: const EdgeInsets.symmetric(horizontal: ThemeProvider.margin08),

// possible values: borderRadius04, borderRadius08, borderRadius16
borderRadius: BorderRadius.circular(ThemeProvider.borderRadius08)

```