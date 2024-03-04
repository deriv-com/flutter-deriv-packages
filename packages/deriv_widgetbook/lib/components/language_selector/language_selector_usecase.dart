import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Language Selector',
  type: LanguageSelectorWidget,
)
Widget expandableBottomSheetDefaultUseCase(BuildContext context) =>
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
              labelContractDetails: 'Select language',
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
