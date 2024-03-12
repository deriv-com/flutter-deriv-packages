import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Language Selector Bottom Sheet',
  type: LanguageItemList,
)
Widget expandableBottomSheetDefaultUseCase(BuildContext context) => Align(
      alignment: Alignment.bottomCenter,
      child: ExpandableBottomSheet(
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
                flag: 'assets/icons/ic_flag_id.png',
              ),
              LanguageModel(
                name: 'Chinese',
                code: 'zh',
                flag: 'assets/icons/ic_flag_zh.png',
              ),
            ],
            onLanguageSelected: (LanguageModel item) {}),
      ),
    );
