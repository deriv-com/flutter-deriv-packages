import 'package:example/core/enums.dart';

abstract class BaseConnectivityService {
  Stream<ConnectivityStatus> get connectivityStatus;
}
