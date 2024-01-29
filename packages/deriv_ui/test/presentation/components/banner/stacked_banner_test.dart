import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Stacked banner', () {
    late StackedBannerController controller;
    setUp(() {
      controller = StackedBannerController();
    });

    testWidgets('add item works', (WidgetTester tester) async {
      await tester.pumpWidget(_BannerWrapper(controller: controller));

      controller.addItem(const Text('MockItem1'));

      await tester.pumpAndSettle();

      expect(find.text('MockItem1'), findsNWidgets(1));
    });

    testWidgets('remove item works', (WidgetTester tester) async {
      await tester.pumpWidget(_BannerWrapper(controller: controller));

      const Widget item = Text('MockItem1');

      controller.addItem(item);

      await tester.pumpAndSettle();

      controller.removeItem(item);
      await tester.pumpAndSettle();

      expect(find.text('MockItem1'), findsNothing);
    });
  });
}

class _BannerWrapper extends StatelessWidget {
  const _BannerWrapper({required this.controller, Key? key}) : super(key: key);
  final StackedBannerController controller;

  @override
  Widget build(BuildContext context) =>
      MaterialApp(home: StackedBanner(controller: controller));
}
