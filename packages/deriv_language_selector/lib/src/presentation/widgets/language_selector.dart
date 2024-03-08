import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template language_selector}
/// A widget that displays the language selector.
/// It can be used as a button or a bottom sheet based on the constructor used.
/// It uses [LanguageCubit] to manage the language state.
///
/// The following parameters are accepted:
///
/// * [showLanguageBottomSheet(optional)] - Function to show the language bottom sheet. The
/// bottom sheet widget is provided through this function. This is added to give client
/// apps flexibility to use their own handler for bottom sheet. Example, P2P uses
/// Overlay.showDialog while GO uses showModalBottomSheet.
/// * [bottomsheetTitle] - Title of the bottom sheet for the case when going for default bottom sheet.
/// * [usePackageFlags (optional)] - Determines if the package flag assets should be used. IF set to false,
/// the client apps need to have assets added under the [assets/icons/flags] folder. The naming
/// convention should be [ic_flag_language_code].png.
///
/// It has two constructors:
///
/// * [LanguageSelector.bottomSheet] - Instantiate [LanguageSelector] as a bottomsheet. This bottomsheet
/// widget can be used to pass to the client app's bottom sheet handler.
/// Example:
/// ```dart
/// showModalBottomSheet(
///   context: context,
///  builder: (BuildContext context) => LanguageSelector.bottomSheet(
///   usePackageFlags: false,
/// );
/// ```
///
/// * [LanguageSelector.button] - Instantiate [LanguageSelector] as a button that opens the language
/// bottom sheet when clicked. This constructor also requires the [bottomsheetTitle] to be provided incase
/// the client app wants default bottom sheet handler to be used.
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
/// {@endtemplate}
class LanguageSelector extends StatelessWidget {
  /// Instantiate [LanguageSelector] as a bottomsheet.
  /// The bottom sheet provides list of languages to select from.
  const LanguageSelector.bottomSheet({
    this.usePackageFlags = true,
    Key? key,
  })  : isBottomSheet = true,
        showLanguageBottomSheet = null,
        bottomsheetTitle = null,
        super(key: key);

  /// Instantiate [LanguageSelector] as a button that opens
  /// the language bottom sheet when clicked.
  const LanguageSelector.button({
    required this.bottomsheetTitle,
    this.showLanguageBottomSheet,
    this.usePackageFlags = true,
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

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<LanguageCubit, LanguageState>(
        bloc: BlocProvider.of<LanguageCubit>(context),
        builder: (BuildContext context, LanguageState state) => isBottomSheet!
            ? _buildLanguageBottomSheet(context, state)
            : LanguageSelectorWidget(
                package: usePackageFlags ? 'deriv_language_selector' : null,
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
          BuildContext context, LanguageState state) =>
      LanguageItemList(
        package: usePackageFlags ? 'deriv_language_selector' : null,
        items: state.activeLanguages
          ..sort(
              (LanguageModel a, LanguageModel b) => a.name.compareTo(b.name)),
        onLanguageSelected: (LanguageModel language) {
          context.read<LanguageCubit>().updateLanguage(language);
        },
        selectedItem: state.language,
      );
}
