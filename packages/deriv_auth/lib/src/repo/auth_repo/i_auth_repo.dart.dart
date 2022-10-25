import 'package:deriv_auth/src/auth/models/authorize.dart';
import 'package:deriv_auth/src/models/logout/logout_response.dart';

abstract class IAuthRepo {
  Future<LogoutResponseEntity> logout();
  Future<AuthorizeResponse?> authorize(String? token);
}
