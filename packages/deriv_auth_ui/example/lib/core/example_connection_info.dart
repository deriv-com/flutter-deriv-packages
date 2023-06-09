import 'package:deriv_auth/deriv_auth.dart';

/// Class that contains ConnectionInfo related to [Example].
class ExampleConnectionInfo implements AuthConnectionInfo {
  @override
  String get appId => 'appId';

  @override
  String get endpoint => 'endpoint';
}
