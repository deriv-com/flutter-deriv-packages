import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_survicate_example/main.dart';

void main() {
  testWidgets('Verify building and triggering a frame.',
      (WidgetTester tester) async => tester.pumpWidget(App()));
}
