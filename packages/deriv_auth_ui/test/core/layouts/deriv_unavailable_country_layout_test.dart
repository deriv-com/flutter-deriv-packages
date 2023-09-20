import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:deriv_ui/presentation/widgets/fullscreen_message.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../../base_test_app.dart';

void main() {
  patrolTest('DerivUnavailableCountryLayout', (PatrolTester $) async {
    await $.pumpWidgetAndSettle(BaseTestApp(
      child: DerivUnavailableCountryLayout(
        appName: 'TestApp',
        onLiveChatPressed: () {},
      ),
    ));

    expect($(FullscreenMessage).exists, equals(true));
  });
}
