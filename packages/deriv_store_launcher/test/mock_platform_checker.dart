import 'package:deriv_store_launcher/platform_checker.dart';

class MockPlatformChecker extends PlatformChecker {
  /// Initializes [MockPlatformChecker].
  MockPlatformChecker({required bool isIOS}) : _isIOS = isIOS;

  final bool _isIOS;

  @override
  bool get isIOS => _isIOS;

  @override
  bool get isAndroid => !_isIOS;
}
