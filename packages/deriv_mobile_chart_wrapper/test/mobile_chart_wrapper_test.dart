import 'package:deriv_localizations/l10n/generated/deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper_localizations.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/mobile_tools_bottom_sheet_content.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';

class MockToolsController extends Mock implements ToolsController {
  @override
  bool get indicatorsEnabled => true;
}

class MockAddOnsRepository<T extends AddOnConfig> extends Mock
    implements AddOnsRepository<T> {}

void main() {
  group('MobileChartWrapper Tests', () {
    late MockAddOnsRepository<IndicatorConfig> mockIndicatorsRepo;
    late DataSeries<Tick> mockMainSeries;

    setUp(() {
      mockIndicatorsRepo = MockAddOnsRepository<IndicatorConfig>();
      mockMainSeries = LineSeries([]);
      SharedPreferences.setMockInitialValues({});
    });

    testWidgets('MobileChartWrapper initializes correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: MobileChartWrapper(
              mainSeries: mockMainSeries,
              granularity: 60,
              toolsController: ToolsController(),
            ),
          ),
        ),
      );

      // Verify initial state
      expect(find.byType(MobileChartWrapper), findsOneWidget);
    });

    testWidgets('ToolsController showIndicatorsToolsMenu callback is set',
        (WidgetTester tester) async {
      final mockToolsController = MockToolsController();
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: MobileChartWrapper(
              mainSeries: mockMainSeries,
              granularity: 60,
              toolsController: mockToolsController,
            ),
          ),
        ),
      );

      // Verify callback is set
      verify(mockToolsController.onShowIndicatorsToolsMenu = any).called(1);
    });

    testWidgets('MobileChartWrapper shows indicators sheet',
        (WidgetTester tester) async {
      final toolsController = ToolsController();

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            DerivMobileChartWrapperLocalizations.delegate,
          ],
          home: Material(
            child: MobileChartWrapper(
              mainSeries: mockMainSeries,
              granularity: 60,
              toolsController: toolsController,
            ),
          ),
        ),
      );

      // Trigger the callback to show the sheet
      toolsController.showIndicatorsToolsMenu();
      await tester.pump();

      // Verify the bottom sheet is displayed
      expect(find.byType(MobileToolsBottomSheetContent), findsOneWidget);
    });

  });
}
