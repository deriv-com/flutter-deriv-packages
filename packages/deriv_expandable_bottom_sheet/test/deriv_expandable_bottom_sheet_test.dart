import 'package:deriv_expandable_bottom_sheet/deriv_expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Expandable Bottom Sheet =>', () {
    const String title = 'Expandable Bottom Sheet Title';
    const String hint = 'Expandable Bottom Sheet Hint';

    testWidgets('should open and close when tap on toggler.',
        (WidgetTester tester) async {
      late bool isOpen;

      final ExpandableBottomSheet bottomSheet = ExpandableBottomSheet(
        title: title,
        upperContent: Container(),
        lowerContent: Container(),
        onOpen: () => isOpen = true,
        onClose: () => isOpen = false,
        labelContractDetails: '',
      );

      final Finder togglerFinder = find.text(title);

      await tester.pumpWidget(_TestApp(bottomSheet));

      await tester.tap(togglerFinder);
      await tester.pump();

      expect(isOpen, isTrue);

      await tester.tap(togglerFinder);
      await tester.pump();

      expect(isOpen, isFalse);
    });

    testWidgets('should open when drag up toggler.',
        (WidgetTester tester) async {
      late bool isOpen;

      final ExpandableBottomSheet bottomSheet = ExpandableBottomSheet(
        title: title,
        upperContent: Container(),
        lowerContent: Container(),
        onOpen: () => isOpen = true,
        labelContractDetails: '',
      );

      await tester.pumpWidget(_TestApp(bottomSheet));

      await tester.drag(find.text(title), const Offset(0, -300));
      await tester.pump();

      expect(isOpen, isTrue);
    });

    testWidgets('should close when drag down toggler.',
        (WidgetTester tester) async {
      bool isOpen = true;

      final ExpandableBottomSheet bottomSheet = ExpandableBottomSheet(
        title: title,
        upperContent: Container(),
        lowerContent: Container(),
        onClose: () => isOpen = false,
        labelContractDetails: '',
      );

      await tester.pumpWidget(_TestApp(bottomSheet));

      await tester.drag(find.text(title), const Offset(0, -300));
      await tester.pump();
      await tester.drag(find.text(title), const Offset(0, 300));
      await tester.pump();

      expect(isOpen, isFalse);
    });

    testWidgets('should set title when `title` has value.', (
      WidgetTester tester,
    ) async {
      final ExpandableBottomSheet bottomSheet = ExpandableBottomSheet(
        title: title,
        upperContent: Container(),
        lowerContent: Container(),
        labelContractDetails: '',
      );

      await tester.pumpWidget(_TestApp(bottomSheet));

      expect(find.text(title), findsOneWidget);
    });

    testWidgets('should set and open hint when `hint` has value.', (
      WidgetTester tester,
    ) async {
      final ExpandableBottomSheet bottomSheet = ExpandableBottomSheet(
        title: title,
        hint: hint,
        upperContent: Container(),
        lowerContent: Container(),
        labelContractDetails: '',
      );

      await tester.pumpWidget(_TestApp(bottomSheet));

      await tester.tap(find.byIcon(Icons.info_outline));
      await tester.pump();

      expect(find.text(hint), findsOneWidget);
    });

    testWidgets('adding left action and test action execution.',
        (WidgetTester tester) async {
      bool isExecuted = false;

      final ExpandableBottomSheet bottomSheet = ExpandableBottomSheet(
        title: title,
        upperContent: Container(),
        lowerContent: Container(),
        leftAction: TextButton(
          child: const Text('left action'),
          onPressed: () => isExecuted = true,
        ),
        labelContractDetails: '',
      );

      await tester.pumpWidget(_TestApp(bottomSheet));

      await tester.tap(find.byType(TextButton));
      await tester.pump();

      expect(isExecuted, isTrue);
    });

    testWidgets('adding right action and test action execution.',
        (WidgetTester tester) async {
      bool isExecuted = false;

      final ExpandableBottomSheet bottomSheet = ExpandableBottomSheet(
        title: title,
        upperContent: Container(),
        lowerContent: Container(),
        rightAction: TextButton(
          child: const Text('right action'),
          onPressed: () => isExecuted = true,
        ),
        labelContractDetails: '',
      );

      await tester.pumpWidget(_TestApp(bottomSheet));

      await tester.tap(find.byType(TextButton));
      await tester.pump();

      expect(isExecuted, isTrue);
    });

    testWidgets('hint should override [rightAction] widget.',
        (WidgetTester tester) async {
      final ExpandableBottomSheet bottomSheet = ExpandableBottomSheet(
        title: title,
        hint: hint,
        upperContent: Container(),
        lowerContent: Container(),
        rightAction: TextButton(
          child: const Text('right action'),
          onPressed: () {},
        ),
        labelContractDetails: '',
      );

      await tester.pumpWidget(_TestApp(bottomSheet));

      expect(find.byType(TextButton), findsNothing);
    });

    testWidgets('should call `onOpen()` callback on bottom sheet open.',
        (WidgetTester tester) async {
      int timesExecuted = 0;

      final ExpandableBottomSheet bottomSheet = ExpandableBottomSheet(
        title: title,
        upperContent: Container(),
        lowerContent: Container(),
        onOpen: () => timesExecuted++,
        labelContractDetails: '',
      );

      final Finder togglerFinder = find.text(title);

      await tester.pumpWidget(_TestApp(bottomSheet));

      await tester.drag(togglerFinder, const Offset(0, -300));
      await tester.pump();

      expect(timesExecuted, 1);

      await tester.tap(togglerFinder);
      await tester.pump();
      await tester.tap(togglerFinder);
      await tester.pump();

      expect(timesExecuted, 2);
    });

    testWidgets('should call `onClose()` callback on bottom sheet close.',
        (WidgetTester tester) async {
      int timesExecuted = 0;

      final ExpandableBottomSheet bottomSheet = ExpandableBottomSheet(
        title: title,
        upperContent: Container(),
        lowerContent: Container(),
        onClose: () => timesExecuted++,
        labelContractDetails: '',
      );

      final Finder togglerFinder = find.text(title);

      await tester.pumpWidget(_TestApp(bottomSheet));

      await tester.tap(togglerFinder);
      await tester.pump();

      await tester.drag(togglerFinder, const Offset(0, 300));
      await tester.pump();

      expect(timesExecuted, 1);

      await tester.tap(togglerFinder);
      await tester.pump();
      await tester.tap(togglerFinder);
      await tester.pump();

      expect(timesExecuted, 2);
    });

    testWidgets('should call `onDismiss()` callback on bottom sheet dismiss.',
        (WidgetTester tester) async {
      bool isDismissed = false;

      final ExpandableBottomSheet bottomSheet = ExpandableBottomSheet(
        title: title,
        upperContent: Container(),
        onDismiss: () => isDismissed = true,
        labelContractDetails: '',
      );

      await tester.pumpWidget(_TestApp(bottomSheet));

      await tester.drag(find.text(title), const Offset(0, 100));
      await tester.pump();

      expect(isDismissed, isTrue);
    });
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp(this.bottomSheet);

  final ExpandableBottomSheet bottomSheet;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(bottomSheet: bottomSheet),
      );
}
