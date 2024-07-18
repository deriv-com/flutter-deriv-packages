import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

/// A widget that allows users to select an option from a list of options.
class OptionSelector extends StatefulWidget {
  const OptionSelector({
    super.key,
    required this.label,
    required this.options,
    required this.onOptionSelected,
    this.selectedIndex = 0,
  });

  /// The label of the option selector.
  final String label;

  /// List of options to be displayed.
  final List<String> options;

  /// Callback function to be called when an option is selected.
  /// The selected option will be passed as a parameter.
  final ValueSetter<String> onOptionSelected;

  /// The index of the currently selected option.
  final int selectedIndex;

  @override
  State<OptionSelector> createState() => _OptionSelectorState();
}

class _OptionSelectorState extends State<OptionSelector> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.label,
          style: context.theme.textStyle(
            textStyle: TextStyles.caption,
            color: context.theme.colors.general,
          ),
        ),
        const SizedBox(height: 2),
        Flexible(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: widget.options.length,
            itemBuilder: (context, index) {
              final isSelected = index == _selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                  widget.onOptionSelected(widget.options[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: _OptionSelectableItem(
                    isSelected: isSelected,
                    option: widget.options[index],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _OptionSelectableItem extends StatelessWidget {
  const _OptionSelectableItem({required this.isSelected, required this.option});

  final bool isSelected;
  final String option;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected
              ? context.theme.colors.blue
              : context.theme.colors.active,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Center(
          child: Text(
            option,
            style: context.theme.textStyle(
              textStyle: TextStyles.body2,
              color: context.theme.colors.prominent,
            ),
          ),
        ),
      ),
    );
  }
}
