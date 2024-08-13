import 'package:deriv_auth/deriv_auth.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';

/// Class that contains ConnectionInfo
class DerivAuthConnectionInfo implements AuthConnectionInfo {
  @override
  String get appId => ConnectionCubit.appId;

  @override
  String get endpoint => ConnectionCubit.endpoint;
}
