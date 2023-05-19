import 'package:deriv_expandable_bottom_sheet/core/utils/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Device Info', () {
    test('hasTopNotch should be false by default', () {
      expect(DeviceInfo.hasTopNotch, false);
    });

    testWidgets('init should initialize devicePadding and hasTopNotch', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            DeviceInfo.init(context);
            return Container();
          },
        ),
      ));

      expect(DeviceInfo.devicePadding, isNotNull);
      expect(DeviceInfo.hasTopNotch, isNotNull);
    });
  });
}
