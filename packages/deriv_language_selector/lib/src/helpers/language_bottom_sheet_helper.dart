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
          minChildSize: 0.6, // Allow shrinking upto 60%
          maxChildSize:
              0.95, // Full screen when expanded 95% (since the status bar is there)
          expand: false,
          builder: (BuildContext context, ScrollController controller) =>
              Column(
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SizedBox(
                  height: ThemeProvider.margin24,
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: ThemeProvider.margin32,
                      ),
                      height: ThemeProvider.margin04,
                      width: ThemeProvider.margin40,
                      decoration: BoxDecoration(
                        color: context.theme.colors.active,
                        borderRadius: BorderRadius.circular(
                          ThemeProvider.borderRadius04,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: ThemeProvider.margin14,
                ),
                child: Text(
                  bottomsheetTitle,
                  style: context.theme.textStyle(
                    textStyle: TextStyles.subheading,
                    color: context.theme.colors.prominent,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    children: <Widget>[
                      LanguageSelector.bottomSheet(
                        usePackageFlags: usePackageFlags,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
