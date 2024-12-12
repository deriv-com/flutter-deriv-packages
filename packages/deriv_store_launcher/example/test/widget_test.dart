import 'package:flutter_test/flutter_test.dart';
import 'package:deriv_store_launcher_example/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Store Launcher Example App: Widget Tests', () {
    testWidgets('Check if the main components are displayed',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      // Verify all buttons are present
      expect(find.text('Open DP2P'), findsOneWidget);
      expect(find.text('Open DerivX'), findsOneWidget);
      expect(find.text('Check DP2P Installed'), findsOneWidget);
      expect(find.text('Check DerivX Installed'), findsOneWidget);
      expect(find.text('Open DP2P in Store'), findsOneWidget);
      expect(find.text('Open DerivX in Store'), findsOneWidget);
    });
  });
}
