import 'package:deriv_language_selector/src/cubits/language_cubit.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that displays the language selector.
/// It can be used as a button or a bottom sheet based on the constructor used.
/// It uses [LanguageCubit] to manage the language state.
class LanguageSelector extends StatelessWidget {
  /// Instantiate [LanguageSelector] as a bottomsheet.
  const LanguageSelector.bottomSheet({
    Key? key,
  })  : isBottomSheet = true,
        showLanguageBottomSheet = null,
        super(key: key);

  /// Instantiate [LanguageSelector] as a button.
  const LanguageSelector.button({
    required this.showLanguageBottomSheet,
    Key? key,
  })  : isBottomSheet = false,
        super(key: key);

  /// Function to show the language bottom sheet.
  /// The bottom sheet widget is passed through this function
  /// to client code to show the bottom sheet.
  final Function(Widget bottomsheet, BuildContext context)?
      showLanguageBottomSheet;

  /// Flag to determine if the widget is a bottom sheet or a button.
  final bool? isBottomSheet;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<LanguageCubit, LanguageState>(
        bloc: BlocProvider.of<LanguageCubit>(context),
        builder: (BuildContext context, LanguageState state) => isBottomSheet!
            ? LanguageItemList(
                items: state.activeLanguages
                  ..sort((LanguageModel a, LanguageModel b) =>
                      a.name.compareTo(b.name)),
                onLanguageSelected: (LanguageModel language) {
                  context.read<LanguageCubit>().updateLanguage(language);
                },
                selectedItem: state.language,
              )
            : LanguageSelectorWidget(
                languageItem: state.language,
                onPressed: () {
                  showLanguageBottomSheet?.call(
                    LanguageItemList(
                      items: state.activeLanguages
                        ..sort((LanguageModel a, LanguageModel b) =>
                            a.name.compareTo(b.name)),
                      onLanguageSelected: (LanguageModel language) {
                        context.read<LanguageCubit>().updateLanguage(language);
                      },
                      selectedItem: state.language,
                    ),
                    context,
                  );
                }),
      );
}
