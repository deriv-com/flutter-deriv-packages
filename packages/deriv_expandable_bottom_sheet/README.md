# Deriv Expandable Bottom Sheet Widget
## Overview
The `ExpandableBottomSheet` widget helps to display an expandable bottom sheet with `title`, `upperContent`, and `lowerContent` parts. All properties are optional. It calculates the height in the minimized state based on `upperContent`, but if `maxHeight` and `lowerContent` are set, the value will be overridden. It can also open the bottom sheet in full size if `openMaximized` is set to `true`.

## Installation
Add the following to your `pubspec.yaml`:
```
deriv_expandable_bottom_sheet:
  git:
    url: git@github.com:deriv-com/flutter-deriv-packages.git
    path: packages/deriv_expandable_bottom_sheet
    ref: dev
```
Then run `flutter pub get` to fetch the package.

Import the `deriv_expandable_bottom_sheet` package in the files where you need to use it:
```
import 'package:deriv_expandable_bottom_sheet/deriv_expandable_bottom_sheet.dart';
```
## Usage
To use the `ExpandableBottomSheet` widget, import the package `deriv_expandable_bottom_sheet` and add it to your Dart file. Then, create an instance of the widget by calling its constructor and providing the required properties:
```
ExpandableBottomSheet(
  themeProvider: ThemeProvider(Brightness.light),
  labelContractDetails: 'Test Label Contract Details',
  upperContent: Container(
    height: 200,
    child: const Text(
      'Example Upper Content',
      style: TextStyle(fontSize: 24),
    ),
  ),
  lowerContent: Container(
    height: 200,
    child: const Text(
      'Example Lower Content',
      style: TextStyle(fontSize: 24),
    ),
  ),
);

```
## Parameters
### Required Parameters
- `themeProvider`: an instance of ThemeProvider class that provides the theme for the bottom sheet.
- `labelContractDetails`: a string that represents the label for the contract details.
- `upperContent`: a widget that represents the upper content part of the bottom sheet.
### Optional Parameters
- `title`: a string that represents the title of the bottom sheet.
- `controller`: an instance of `ExpandableBottomSheetController` class that can be used to get control of the bottom sheet's functionalities.
- `hint`: a string that represents the hint button of the bottom sheet.
- `leftAction`: a widget that represents the action placed on the left side of the title.
- `rightAction`: a widget that represents the action placed on the right side of the title.
- `lowerContent`: a widget that represents the lower content part of the bottom sheet.
- `fullScreenMode`: a boolean value that defines whether the bottom sheet would be in full-screen mode when its open.
- `showToggler`: a boolean value that sets toggler visibility. If the value is set to `false`, `dragging` and `toggle` actions will be disabled. The default value is `true`.
- `maxHeight`: a double value that sets the maximum height for the expandable bottom sheet. The expandable bottom sheet will be full screen if `maxHeight` is not set.
- `openMaximized`: a boolean value that opens the expandable bottom sheet in maximized state. The default value is `false`.
- `dismissible`: a boolean value that defines whether the bottom sheet should get closed when the user swipes it down. The default value is `true`.
- `changeStateDuration`: a `Duration` value that sets the change state animation duration. The default value is `350 milliseconds`.
- `onOpen`: a `VoidCallback` that is called when the expandable bottom sheet is open.
- `onClose`: a `VoidCallback` that is called when the expandable bottom sheet is closed.
- `onClosed`: a `VoidCallback` that is called when the expandable bottom sheet is already closed.
- `onToggle`: a `VoidCallback` that is called when the toggle expandable bottom sheet.
- `onDismiss`: a `VoidCallback` that is called on the expandable bottom sheet dismiss.

## Example App
Here's an example app demonstrating the usage of the `ExpandableBottomSheet` package:
```
/// This imports the required packages.
import 'package:deriv_expandable_bottom_sheet/deriv_expandable_bottom_sheet.dart';
import 'package:deriv_theme/theme_provider.dart';
import 'package:flutter/material.dart';

/// This is a home screen widget that displays a button to show the expandable bottom sheet.
class Home extends StatelessWidget {

  /// This is a const constructor that takes a key.
  const Home({Key? key}) : super(key: key);

  /// This function displays the expandable bottom sheet when the button is clicked.
  Future<void> _showExpandableBottomSheet(BuildContext context) =>
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) => ExpandableBottomSheet(
          labelContractDetails: 'Test Label Contract Details',
          themeProvider: const ThemeProvider(Brightness.light),
          upperContent: Container(
            height: 200,
            child: const Text(
              'Example Upper Content',
              style: TextStyle(fontSize: 24),
            ),
          ),
          lowerContent: Container(
            height: 200,
            child: const Text(
              'Example Lower Content',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) =>
    Scaffold(
      appBar: AppBar(
        title: const Text('Expandable Bottom Sheet Demo'),
      ),
      body: MediaQuery(
        data: const MediaQueryData(),
        child: Center(
          child: ElevatedButton(
            child: const Text('Show Expandable Bottom Sheet'),
            onPressed: () => _showExpandableBottomSheet(context),
          ),
        ),
      ),
    );
  
}
```
