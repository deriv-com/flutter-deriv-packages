import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A helper function to show the language bottom sheet.
void showExpandableLanguageBottomSheet({
  required BuildContext context,
  required String bottomsheetTitle,
  bool usePackageFlags = true,
}) =>
    showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (BuildContext innerContext) => BlocProvider<LanguageCubit>.value(
        value: BlocProvider.of<LanguageCubit>(context),
        child: ExpandableBottomSheet(
          title: bottomsheetTitle,
          upperContent: LanguageSelector.bottomSheet(
            usePackageFlags: usePackageFlags,
          ),
          // TODO(sahani): Remove labelContractDetails
          labelContractDetails: '',
        ),
      ),
    );
