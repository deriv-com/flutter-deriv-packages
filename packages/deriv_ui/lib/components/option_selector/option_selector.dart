import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

/// A widget that allows users to select an option from a list of options.
class OptionSelector extends StatelessWidget {
  /// Initializes [OptionSelector]
  const OptionSelector({
    required this.label,
    required this.options,
    required this.onOptionSelected,
    this.selectedIndex = 0,
    super.key,
  });

  /// The label of the option selector.
  final String label;

  /// List of options to be displayed.
  final List<String> options;

  /// Callback function to be called when an option is selected.
  /// The selected index will be passed as a parameter.
  final ValueSetter<int> onOptionSelected;

  /// The index of the currently selected option.
  final int selectedIndex;

  @override
  Widget build(BuildContext context) => Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTitle(context),
        const SizedBox(height: ThemeProvider.margin08),
        _buildItemsHorizontalList(context),
      ],
    );

  Text _buildTitle(BuildContext context) => Text(
      label,
      style: context.theme.textStyle(
        textStyle: TextStyles.caption,
        color: context.theme.colors.general,
      ),
    );

  SizedBox _buildItemsHorizontalList(BuildContext context) => SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: options.length,
        itemBuilder: (BuildContext context, int index) {
          final bool isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              onOptionSelected(index);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                right: ThemeProvider.margin08,
              ),
              child: _OptionSelectableItem(
                isSelected: isSelected,
                option: options[index],
              ),
            ),
          );
        },
      ),
    );
}

class _OptionSelectableItem extends StatelessWidget {
  const _OptionSelectableItem({required this.isSelected, required this.option});

  final bool isSelected;
  final String option;

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ThemeProvider.borderRadius08,
        ),
        border: Border.all(
          color: isSelected
              ? context.theme.colors.blue
              : context.theme.colors.active,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeProvider.margin16,
          vertical: ThemeProvider.margin14,
        ),
        child: Center(
          child: Text(
            option,
            style: context.theme.textStyle(
              textStyle: TextStyles.body2,
              color: isSelected
                  ? context.theme.colors.prominent
                  : context.theme.colors.general,
            ),
          ),
        ),
      ),
    );
}
