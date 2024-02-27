# deriv_widgetbook

A flutter project that showcases all the current `deriv_ui` components and widgets and also gives you superpowers to test your widget on different states. This project was developed using [Widgetbook](https://docs.widgetbook.io/index). Currently, following features are supported to test and view your widget in this project:

- [x] Change in Device Sizes and Orientation
- [x] Change in Theme (only dark mode currently)
- [x] Change in Text Scale Factor
- [x] Change in Localisation (only English currently)
- [x] Dynamic Values for Widgets (Example: Change in Text for Button Text)
- [x] Change in Alignment


## Project Support

This project supports iOS, Android, and Web. But it is recommended to run on Web for easy navigations between the widgets. 

## Adding a new widget/component

All the setup for currently needed [addons](https://docs.widgetbook.io/addons/overview) has been done. You just need to add the usecases for your widget/component.

1. Create a new file in `lib/widgets` or `lib/components` if adding a component.
2. Add your usecases. Example: 
```dart
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Enabled',
  type: PrimaryButton,
)
Widget primaryButtonEnabledUseCase(BuildContext context) => PrimaryButton(
      onPressed: () {},
      child: Text(
        context.knobs.string(
          label: 'Button Text',
          initialValue: 'Text',
        ), //knobs allows you to change the text of the button in widgetbook
        style: context.theme.textStyle(
          textStyle: TextStyles.body2,
          color: context.theme.colors.prominent,
        ),
      ),
    );
```
3. Run the following command to generate the usecase:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

 



