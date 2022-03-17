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

  group('Custom chip test', () {
    testWidgets(
      'should change the text inside of the chip widget.',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
              home: _TestWidget(
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
          )),
        );

        await tester.pumpAndSettle();

        expect(find.byType(CustomChip), findsOneWidget);
        expect(find.text(_value), findsOneWidget);

        await tester.tap(find.byKey(const Key('Value')));

        await tester.pump();
        expect(find.text('test'), findsOneWidget);
      },
    );

    testWidgets(
      'Should only show value when no title is provided.',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
              home: CustomChip(
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
          )),
        );

        await tester.pumpAndSettle();

        expect(find.byType(CustomChip), findsOneWidget);
        expect(find.textContaining(':'), findsNothing);
      },
    );

    testWidgets(
      'Should show both chip title and chip value when both is provided is provided.',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CustomChip(
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
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byType(CustomChip), findsOneWidget);
        expect(find.text('$_title: $_value'), findsOneWidget);
      },
    );
  });
}

class _TestWidget extends StatefulWidget {
  const _TestWidget({
    required this.value,
    required this.chipBorderRadius,
    required this.chipHorizontalPadding,
    required this.chipVerticalPadding,
    required this.containerHeight,
    required this.disabledBackgroundColor,
    required this.enabledBackgroundColor,
    required this.disabledTextColor,
    required this.enabledTextColor,
    required this.textStyle,
    Key? key,
  }) : super(key: key);

  final String value;
  final double chipBorderRadius;
  final double chipHorizontalPadding;
  final double chipVerticalPadding;
  final double containerHeight;
  final Color disabledBackgroundColor;
  final Color enabledBackgroundColor;
  final Color disabledTextColor;
  final Color enabledTextColor;
  final TextStyle textStyle;

  @override
  __TestWidgetState createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  void initState() {
    value = widget.value;
    chipBorderRadius = widget.chipBorderRadius;
    chipHorizontalPadding = widget.chipHorizontalPadding;
    chipVerticalPadding = widget.chipVerticalPadding;
    containerHeight = widget.containerHeight;
    disabledBackgroundColor = widget.disabledBackgroundColor;
    enabledBackgroundColor = widget.enabledBackgroundColor;
    disabledTextColor = widget.disabledTextColor;
    enabledTextColor = widget.enabledTextColor;
    textStyle = widget.textStyle;
    super.initState();
  }

  late String value;
  late double chipBorderRadius;
  late double chipHorizontalPadding;
  late double chipVerticalPadding;
  late double containerHeight;
  late Color disabledBackgroundColor;
  late Color enabledBackgroundColor;
  late Color disabledTextColor;
  late Color enabledTextColor;
  late TextStyle textStyle;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: CustomChip(
            value: value,
            chipBorderRadius: chipBorderRadius,
            chipHorizontalPadding: chipHorizontalPadding,
            chipVerticalPadding: chipVerticalPadding,
            containerHeight: containerHeight,
            disabledBackgroundColor: disabledBackgroundColor,
            enabledBackgroundColor: enabledBackgroundColor,
            disabledTextColor: disabledTextColor,
            enabledTextColor: enabledTextColor,
            textStyle: textStyle,
          ),
          floatingActionButton: ElevatedButton(
            key: const Key('Value'),
            child: Container(
              height: 10,
              width: 10,
            ),
            onPressed: () => setState(() => value = 'test'),
          ),
        ),
      );
}
