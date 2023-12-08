import 'package:example/features/active_symbol/domain/active_symbol_entity.dart';
import 'package:example/features/active_symbol/presentation/widgets/active_symbol_dropdown_items.dart';
import 'package:flutter/material.dart';

class ActiveSymbolDropdown extends StatelessWidget {
  const ActiveSymbolDropdown({
    required this.activeSymbols,
    this.selectedActiveSymbol,
    this.onChanged,
    super.key,
  });

  final List<ActiveSymbolEntity> activeSymbols;
  final ActiveSymbolEntity? selectedActiveSymbol;
  final void Function(ActiveSymbolEntity entity)? onChanged;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        child: DropdownButton<ActiveSymbolEntity>(
          isExpanded: true,
          value: selectedActiveSymbol,
          underline: const SizedBox.shrink(),
          items: _buildItems().toList(),
          onChanged: (ActiveSymbolEntity? entity) => onChanged?.call(entity!),
        ),
      );

  Iterable<DropdownMenuItem<ActiveSymbolEntity>> _buildItems() =>
      activeSymbols.map(
        (ActiveSymbolEntity activeSymbol) =>
            DropdownMenuItem<ActiveSymbolEntity>(
          value: activeSymbol,
          child: ActiveSymbolDropdownItems(
            symbolName: activeSymbol.symbolDisplayName,
            isSelected: _isSelected(activeSymbol),
          ),
        ),
      );

  bool _isSelected(ActiveSymbolEntity activeSymbol) =>
      activeSymbol.symbolDisplayName == selectedActiveSymbol?.symbolDisplayName;
}
