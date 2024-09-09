import 'package:deriv_localizations/l10n/generated/deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper_localizations.dart';
import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockToolsController extends Mock implements ToolsController {
  @override
  bool get indicatorsEnabled => true;

  @override
  bool get drawingToolsEnabled => true;
}

class MockAddOnsRepository<T extends AddOnConfig> extends Mock
    implements AddOnsRepository<T> {}

void main() {
  group('MobileChartWrapper Tests', () {
    SharedPreferences.setMockInitialValues({
      'default': dynamic,
    });
    testWidgets('MobileChartWrapper initializes correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(_TestWidget(toolsController: ToolsController()));

      // Verify initial state
      expect(find.byType(DerivChart), findsOneWidget);
    });

    testWidgets('ToolsController showIndicatorsToolsMenu callback is set',
        (WidgetTester tester) async {
      final mockToolsController = MockToolsController();
      await tester.pumpWidget(
        _TestWidget(toolsController: mockToolsController),
      );

      // Verify callback is set
      verify(mockToolsController.onShowIndicatorsToolsMenu = any).called(1);
    });

    testWidgets('MobileChartWrapper shows indicators sheet',
        (WidgetTester tester) async {
      final toolsController = ToolsController();

      await tester.pumpWidget(
        _TestWidget(
          toolsController: toolsController,
        ),
      );

      // Trigger the callback to show the sheet
      toolsController.showIndicatorsToolsMenu();
      await tester.pump();

      // Verify the bottom sheet is displayed
      expect(find.byType(MobileToolsBottomSheetContent), findsOneWidget);
    });

    testWidgets('ToolsController showDrawingToolsMenu callback is set',
        (WidgetTester tester) async {
      final mockToolsController = MockToolsController();
      await tester.pumpWidget(
        _TestWidget(toolsController: mockToolsController),
      );

      // Verify callback is set
      verify(mockToolsController.onShowDrawingToolsMenu = any).called(1);
    });
  });
}

class _TestWidget extends StatelessWidget {
  const _TestWidget({required this.toolsController});

  final ToolsController toolsController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DerivMobileChartWrapperLocalizations.delegate,
      ],
      home: Material(
        child: MobileChartWrapper(
          mainSeries: LineSeries([]),
          granularity: 60,
          toolsController: toolsController,
        ),
      ),
    );
  }
}
