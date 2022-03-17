import 'package:deriv_ui/core/widgets/chips_list.dart';
import 'package:deriv_ui/core/widgets/custom_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const String _title = 'title';
  const String _value = 'value';
  const double _chipHorizontalPadding = 10;
  const double _chipVerticalPadding = 10;
  const double _chipContainerHeight = 40;
  const double _chipBorderRadius = 5;
  const Color _disabledTextColor = Colors.black;
  const Color _enabledTextColor = Colors.white;
  const Color _disabledBackgroundColor = Colors.grey;
  const Color _enabledBackgroundColor = Colors.blueAccent;
  const TextStyle _textStyle = TextStyle(color: Colors.white);

  const double _chipListContainerHeight = 500;
  const double _horizontalListPadding = 15;
  const double _listSeparatorPadding = 10;
  group(
    'Chips list widget test',
    () {
      testWidgets(
        'Should have one CustomChip widget inside itself.',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: ChipsList(
                items: <CustomChip>[
                  CustomChip(
                    value: _value,
                    chipBorderRadius: _chipBorderRadius,
                    chipHorizontalPadding: _chipHorizontalPadding,
                    chipVerticalPadding: _chipVerticalPadding,
                    containerHeight: _chipContainerHeight,
                    disabledBackgroundColor: _disabledBackgroundColor,
                    enabledBackgroundColor: _enabledBackgroundColor,
                    disabledTextColor: _disabledTextColor,
                    enabledTextColor: _enabledTextColor,
                    textStyle: _textStyle,
                  )
                ],
                containerHeight: _chipListContainerHeight,
                horizontalListPadding: _horizontalListPadding,
                listSeparatorPadding: _listSeparatorPadding,
              ),
            ),
          );

          await tester.pumpAndSettle();

          expect(find.byType(ChipsList), findsOneWidget);
          expect(find.byType(CustomChip), findsOneWidget);
          expect(find.text(_value), findsOneWidget);
        },
      );

      testWidgets(
        'Should have the specified number of CustomChip widgets inside itself.',
        (WidgetTester tester) async {
          const List<CustomChip> chipItems = <CustomChip>[
            CustomChip(
              value: _value,
              chipBorderRadius: _chipBorderRadius,
              chipHorizontalPadding: _chipHorizontalPadding,
              chipVerticalPadding: _chipVerticalPadding,
              containerHeight: _chipContainerHeight,
              disabledBackgroundColor: _disabledBackgroundColor,
              enabledBackgroundColor: _enabledBackgroundColor,
              disabledTextColor: _disabledTextColor,
              enabledTextColor: _enabledTextColor,
              textStyle: _textStyle,
            ),
            CustomChip(
              title: _title,
              value: _value,
              chipBorderRadius: _chipBorderRadius,
              chipHorizontalPadding: _chipHorizontalPadding,
              chipVerticalPadding: _chipVerticalPadding,
              containerHeight: _chipContainerHeight,
              disabledBackgroundColor: _disabledBackgroundColor,
              enabledBackgroundColor: _enabledBackgroundColor,
              disabledTextColor: _disabledTextColor,
              enabledTextColor: _enabledTextColor,
              textStyle: _textStyle,
            ),
          ];
          await tester.pumpWidget(
            const MaterialApp(
              home: ChipsList(
                items: chipItems,
                containerHeight: _chipListContainerHeight,
                horizontalListPadding: _horizontalListPadding,
                listSeparatorPadding: _listSeparatorPadding,
              ),
            ),
          );

          await tester.pumpAndSettle();

          expect(find.byType(ChipsList), findsOneWidget);
          expect(find.byType(CustomChip), findsNWidgets(chipItems.length));
        },
      );
    },
  );
}
