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
      backgroundColor: getDerivBottomSheetBackgroundColor(context),
      shape: derivBottomSheetBorder,
      builder: (BuildContext innerContext) => BlocProvider<LanguageCubit>.value(
        value: BlocProvider.of<LanguageCubit>(context),
        child: DraggableScrollableSheet(
            initialChildSize: 0.6, // Start at 60% of screen height
            minChildSize: 0.6, // Allow shrinking upto 40%
            maxChildSize:
                0.95, // Full screen when expanded 95% (since the status bar is there)
            expand: false,
            builder: (BuildContext context, ScrollController controller) =>
                Column(
                  children: <Widget>[
                    ...buildDerivBottomSheetHandleWithTitle(
                        context, bottomsheetTitle),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: controller,
                        child: Column(
                          children: <Widget>[
                            LanguageSelector.bottomSheet(
                              usePackageFlags: usePackageFlags,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
      ),
    );
