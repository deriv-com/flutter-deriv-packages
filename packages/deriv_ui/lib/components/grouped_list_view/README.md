# GroupedListView Widget

## Description

`GroupedListView` is a custom Flutter widget that allows you to display a list of items grouped by categories. It's designed to be easy to use and customizable to fit your application's theme and style.

## Usage

To use the `GroupedListView` widget, simply import the `deriv_ui.dart` file into your Dart code:

```dart
import 'package:deriv_ui/deriv_ui.dart';
```

Then, you can use the `GroupedListView` widget in your Flutter code like any other widget:
```dart
GroupedListView<dynamic, String>(
    items: listItems,
    groupBy: (element) => element['group'],
    groupBuilder: (value) => Container(
        padding: const EdgeInsets.all(8.0),
        child: Text(value),
    ),
    itemBuilder: (element) => Container(
        padding: const EdgeInsets.all(8.0),
        child: Text(element['name']),
    ),
    hasStickyHeader: true,
),
```
### Parameters
The `GroupedListView` widget accepts several parameters for customization:

`items`: A list of items you want to display in the list view.

`groupBy`: A function that defines how to group the items.

`groupBuilder`: A function that defines how to build the group headers.

`itemBuilder`: A function that defines how to build the list items.

`hasStickyHeader`: A boolean value that determines whether the group headers should stick at the top.

Please refer to the source code for more details on the available parameters and their usage.

### Example
Here's an example of how to use the GroupedListView widget:

```dart
GroupedListView<dynamic, String>(
    items: [
        {'name': 'John', 'group': 'Team A'},
        {'name': 'Sarah', 'group': 'Team B'},
        {'name': 'Adam', 'group': 'Team A'},
        // More items...
    ],
    groupBy: (element) => element['group'],
    groupBuilder: (value) => Container(
        padding: const EdgeInsets.all(8.0),
        child: Text(value),
    ),
    itemBuilder: (element) => Container(
        padding: const EdgeInsets.all(8.0),
        child: Text(element['name']),
    ),
    hasStickyHeader: true,
),
```
In this example, the list items are grouped by team and the group headers stick at the top.
