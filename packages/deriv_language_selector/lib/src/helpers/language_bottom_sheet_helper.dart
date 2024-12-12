import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:deriv_theme/deriv_theme.dart';
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
      backgroundColor: context.theme.colors.secondary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(ThemeProvider.borderRadius16),
        ),
      ),
      builder: (BuildContext innerContext) => BlocProvider<LanguageCubit>.value(
        value: BlocProvider.of<LanguageCubit>(context),
        child: DraggableScrollableSheet(
          initialChildSize: 0.6, // Start at 60% of screen height
          minChildSize: 0.5, // Allow shrinking upto 50%
          maxChildSize:
              0.95, // Full screen when expanded 95% (since the status bar is there)
          expand: false,
          builder: (BuildContext context, ScrollController controller) =>
              SingleChildScrollView(
            controller: controller,
            child: Column(
              children: <Widget>[
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      color: context.theme.colors.secondary,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: ThemeProvider.margin12,
                        ),
                        height: ThemeProvider.margin04,
                        width: ThemeProvider.margin40,
                        decoration: BoxDecoration(
                          color: context.theme.colors.active,
                          borderRadius: BorderRadius.circular(
                              ThemeProvider.borderRadius04),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: ThemeProvider.margin12,
                  ),
                  child: Text(
                    bottomsheetTitle,
                    style: context.theme.textStyle(
                      textStyle: TextStyles.subheading,
                      color: context.theme.colors.prominent,
                    ),
                  ),
                ),
                LanguageSelector.bottomSheet(
                  usePackageFlags: usePackageFlags,
                ),
              ],
            ),
          ),
        ),
      ),
    );
