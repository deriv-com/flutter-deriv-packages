import 'package:deriv_auth/core/layouts/deriv_unavailable_country_layout.dart';
import 'package:deriv_ui/presentation/widgets/fullscreen_message.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';
import '../../base_test_app.dart';

void main() {
  patrolWidgetTest('DerivUnavailableCountryLayout', (PatrolTester $) async {
    await $.pumpWidgetAndSettle(BaseTestApp(
      child: DerivUnavailableCountryLayout(
        userAgent: '',
        appName: 'TestApp',
        onLiveChatPressed: () {},
      ),
    ));

    expect($(FullscreenMessage).exists, equals(true));
  });
}
