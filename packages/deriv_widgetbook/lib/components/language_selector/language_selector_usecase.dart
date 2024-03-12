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
        onPressed: () async {});
