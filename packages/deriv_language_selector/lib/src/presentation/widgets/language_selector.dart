import 'package:deriv_language_selector/src/cubits/language_cubit.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector.bottomSheet({
    Key? key,
  })  : isBottomSheet = true,
        showLanguageBottomSheet = null,
        super(key: key);

  const LanguageSelector.button({
    Key? key,
    required this.showLanguageBottomSheet,
  })  : isBottomSheet = false,
        super(key: key);

  final Function(Widget, BuildContext)? showLanguageBottomSheet;

  final bool? isBottomSheet;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      bloc: BlocProvider.of<LanguageCubit>(context),
      builder: (context, state) {
        return isBottomSheet!
            ? LanguageItemList(
                items: state.activeLanguages
                  ..sort((a, b) => a.name.compareTo(b.name)),
                onLanguageSelected: (language) {
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
                        ..sort((a, b) => a.name.compareTo(b.name)),
                      onLanguageSelected: (language) {
                        context.read<LanguageCubit>().updateLanguage(language);
                      },
                      selectedItem: state.language,
                    ),
                    context,
                  );
                });
      },
    );
  }
}
