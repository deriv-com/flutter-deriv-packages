import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that displays the language selector.
/// It can be used as a button or a bottom sheet based on the constructor used.
/// It uses [LanguageCubit] to manage the language state.
class LanguageSelector extends StatelessWidget {
  /// Instantiate [LanguageSelector] as a bottomsheet.
  /// The bottom sheet provides list of languages to select from.
  ///
  /// The following parameters are accepted:
  /// * [usePackageFlags (optional)] - Determines if the package flag assets should be used. IF set to false,
  /// the client apps need to have assets added under the [assets/icons/flags] folder. The naming
  /// convention should be [ic_flag_language_code].png. example, ic_flag_en.png.
  ///
  /// Exmaple:
  /// ```dart
  /// showModalBottomSheet(
  /// context: context,
  /// builder: (BuildContext context) => LanguageSelector.bottomSheet(
  /// usePackageFlags: false,
  /// );
  /// ```
  const LanguageSelector.bottomSheet({
    this.usePackageFlags = true,
    this.showButtonFlag = false,
    Key? key,
  })  : isBottomSheet = true,
        showLanguageBottomSheet = null,
        bottomsheetTitle = null,
        super(key: key);

  /// Instantiate [LanguageSelector] as a button that opens
  /// the language bottom sheet when clicked.
  ///
  /// The following parameters are accepted:
  /// * [showLanguageBottomSheet(optional)] - Function to show the language bottom sheet. The
  /// bottom sheet widget is provided through this function. This is added to give client
  /// apps flexibility to use their own handler for bottom sheet. Example, P2P uses
  /// Overlay.showDialog while GO uses showModalBottomSheet.
  /// * [bottomsheetTitle] - Title of the bottom sheet for the case when going for default bottom sheet.
  /// * [usePackageFlags (optional)] - Determines if the package flag assets should be used. IF set to false,
  /// the client apps need to have assets added under the [assets/icons/flags] folder. The naming
  /// convention should be [ic_flag_language_code].png. example, ic_flag_en.png.
  ///
  /// Exmaple:
  /// ```dart
  /// LanguageSelector.button(
  ///  bottomsheetTitle: 'Select Language',
  ///  usePackageFlags: false,
  ///  showLanguageBottomSheet: (Widget bottomsheet, BuildContext context) {
  ///  showModalBottomSheet(
  ///   context: context,
  ///  builder: (BuildContext context) => bottomsheet,
  ///     );
  ///   },
  /// );
  /// ```
  const LanguageSelector.button({
    required this.bottomsheetTitle,
    this.showLanguageBottomSheet,
    this.usePackageFlags = true,
    this.showButtonFlag = false,
    Key? key,
  })  : isBottomSheet = false,
        super(key: key);

  /// Function to show the language bottom sheet.
  /// The bottom sheet widget is passed through this function
  /// to client code to show the bottom sheet. If not provided,
  /// defaults to [showExpandableLanguageBottomSheet].
  final Function(Widget bottomsheet, BuildContext context)?
      showLanguageBottomSheet;

  /// Flag to determine if the widget is a bottom sheet or a button.
  final bool? isBottomSheet;

  /// Title of the bottom sheet for the case when
  /// going for default bottom sheet.
  final String? bottomsheetTitle;

  /// Determines if the package flag assets should be used.
  /// IF set to false, the client apps need to have assets added
  /// under the [assets/icons/flags] folder. The naming convention
  /// should be [ic_flag_language_code].png.
  final bool usePackageFlags;

  /// Since we are not using country flags anymore this will conditionally display
  /// globe icon instead of flag in language selector button
  final bool showButtonFlag;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<LanguageCubit, LanguageState>(
        bloc: BlocProvider.of<LanguageCubit>(context),
        builder: (BuildContext context, LanguageState state) => isBottomSheet!
            ? _buildLanguageBottomSheet(context, state)
            : LanguageSelectorWidget(
                package: usePackageFlags ? 'deriv_language_selector' : null,
                showFlag: showButtonFlag,
                languageItem: state.language,
                onPressed: () {
                  showLanguageBottomSheet != null
                      ? showLanguageBottomSheet!.call(
                          _buildLanguageBottomSheet(context, state),
                          context,
                        )
                      : showExpandableLanguageBottomSheet(
                          context: context,
                          bottomsheetTitle: bottomsheetTitle!);
                }),
      );

  LanguageItemList _buildLanguageBottomSheet(
      BuildContext context, LanguageState state) {
    final List<LanguageModel> langs = state.activeLanguages;
    final int engLangIndex =
        langs.indexWhere((LanguageModel element) => element.code == 'en');

    // make sure english language is always on top
    if (engLangIndex != -1 && engLangIndex != 0) {
      final LanguageModel engLang = langs.removeAt(engLangIndex);
      langs.insert(0, engLang);
    }

    return LanguageItemList(
      package: usePackageFlags ? 'deriv_language_selector' : null,
      items: langs,
      onLanguageSelected: (LanguageModel language) {
        context.read<LanguageCubit>().updateLanguage(language);
      },
      selectedItem: state.language,
    );
  }
}
