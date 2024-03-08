import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

/// A helper function to show the language bottom sheet.
void showExpandableLanguageBottomSheet({
  required BuildContext context,
  required String bottomsheetTitle,
}) =>
    showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (BuildContext context) => ExpandableBottomSheet(
        title: bottomsheetTitle,
        upperContent: const LanguageSelector.bottomSheet(),
        labelContractDetails: '',
      ),
    );
