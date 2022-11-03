import 'package:deriv_auth/src/models/login/login_response.dart';

import '../models/login/login_request.dart';

abstract class IBasicAuthRepo {
  // get token from API
  Future<LoginResponseModel> loginWithEmailAndPassword({
    required LoginRequestModel request,
    required String endpoint,
    required String jwtToken,
  });
}
