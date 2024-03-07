import 'package:deriv_language_selector/src/cubits/language_cubit.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return LanguageSelectorWidget(
            languageItem: state.language,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ExpandableBottomSheet(
                        labelContractDetails: 'labelContractDetails',
                        upperContent: LanguageItemList(
                          items: state.activeLanguages
                            ..sort((a, b) => a.name.compareTo(b.name)),
                          onLanguageSelected: (language) {
                            context
                                .read<LanguageCubit>()
                                .updateLanguage(language);
                          },
                          selectedItem: state.language,
                        ));
                  });
            });
      },
    );
  }
}
