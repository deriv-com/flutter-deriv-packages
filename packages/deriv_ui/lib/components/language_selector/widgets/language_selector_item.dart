import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/components/language_selector/models/language_model.dart';
import 'package:flutter/material.dart';

/// {@template language_selector_item}
/// Language selector item for [LanguageItemList].
/// {@endtemplate}
class LanguageSelectorItem extends StatelessWidget {
  /// {@macro language_selector_item}
  const LanguageSelectorItem({
    required this.isSelected,
    required this.item,
    required this.onPressed,
    this.package,
    Key? key,
  }) : super(key: key);

  /// Whether the item is selected or not.
  final bool isSelected;

  /// [LanguageModel] data as item.
  final LanguageModel item;

  /// Callback function for on pressed.
  final ValueSetter<LanguageModel> onPressed;

  /// Name of the package where the flag image is located.
  final String? package;

  @override
  Widget build(BuildContext context) => IgnorePointer(
        ignoring: isSelected,
        child: TextButton(
          onPressed: () => onPressed(item),
          style: _assignButtonStyle(context),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeProvider.margin16,
              vertical: 20,
            ),
            decoration: _assignDecoration(context),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: ThemeProvider.margin16),
                  child: _buildFlag(context),
                ),
                Text(
                  item.name,
                  style: _assignNameStyle(context),
                ),
              ],
            ),
          ),
        ),
      );

  ButtonStyle _assignButtonStyle(BuildContext context) => ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, ThemeProvider.iconSize58),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeProvider.borderRadius08),
          ),
        ),
        overlayColor: MaterialStateProperty.all(context.theme.colors.hover),
      );

  BoxDecoration _assignDecoration(BuildContext context) => BoxDecoration(
        color: isSelected ? context.theme.colors.hover : Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(ThemeProvider.borderRadius08),
        ),
      );

  Widget _buildFlag(BuildContext context) => Image(
        image: AssetImage(
          item.flag,
          package: package,
        ),
        width: ThemeProvider.margin24,
      );

  TextStyle _assignNameStyle(BuildContext context) => isSelected
      ? context.theme.textStyle(textStyle: TextStyles.body2)
      : context.theme
          .textStyle(textStyle: TextStyles.body1)
          .copyWith(color: context.theme.colors.lessProminent);
}
