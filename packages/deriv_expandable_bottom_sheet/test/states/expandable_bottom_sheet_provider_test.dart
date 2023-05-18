import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deriv_expandable_bottom_sheet/presentation/widgets/expandable_bottom_sheet.dart';

void main() {
  testWidgets('ExpandableBottomSheetProvider should find nearest instance', (WidgetTester tester) async {
    final ExpandableBottomSheetController controller = ExpandableBottomSheetController();

    await tester.pumpWidget(
      ExpandableBottomSheetProvider(
        controller: controller,
        fullScreenMode: null,
        leftAction: null,
        rightAction: null,
        showToggler: true,
        child: MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              final ExpandableBottomSheetProvider? provider = ExpandableBottomSheetProvider.of(context);
              expect(provider, isNotNull);
              expect(provider!.controller, equals(controller));
              return Container();
            },
          ),
        ),
      ),
    );
  });

}
