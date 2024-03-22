# Language Selector Widget

This is the UI component for the language selector. It provides interface for users to select the language they want to use in the application.

## Usage

To use the `LanguageSelectorWidget` widget, simply import the `deriv_ui.dart` file into your Dart code:

```dart
import 'package:deriv_ui/deriv_ui.dart';
```

Then, you can use the `LanguageSelectorWidget` widget in your Flutter code like any other widget:

```dart
 LanguageSelectorWidget(
        languageItem: LanguageModel(
          name: 'English',
          code: 'en',
          flag: 'assets/icons/ic_flag_en.png',
        ),
        onPressed: () async {
          await showModalBottomSheet(
            context: context,
            backgroundColor: context.theme.colors.secondary,
            builder: (BuildContext context) => ExpandableBottomSheet(
              title: 'Language',
              upperContent: LanguageItemList(
                  selectedItem: LanguageModel(
                    name: 'English',
                    code: 'en',
                    flag: 'assets/icons/ic_flag_en.png',
                  ),
                  items: <LanguageModel>[
                    LanguageModel(
                      name: 'English',
                      code: 'en',
                      flag: 'assets/icons/ic_flag_en.png',
                    ),
                    LanguageModel(
                      name: 'Indonesia',
                      code: 'id',
                      flag: 'assets/icons/ic_flag_en.png',
                    ),
                    LanguageModel(
                      name: 'Chinese',
                      code: 'zh',
                      flag: 'assets/icons/ic_flag_en.png',
                    ),
                  ],
                  onLanguageSelected: (LanguageModel item) {}),
            ),
          );
        });
```