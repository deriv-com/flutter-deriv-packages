import 'package:deriv_auth/src/core/api_client/http_client.dart';
import 'package:deriv_auth/src/models/login/login_response.dart';
import 'package:deriv_auth/src/models/login/login_request.dart';
import 'package:deriv_auth/src/repo/i_auth_repo.dart';

class BasicAuthRepo extends IBasicAuthRepo {
  final HttpClient client = HttpClient();
  @override
  Future<LoginResponseModel> loginWithEmailAndPassword({
    required LoginRequestModel request,
    required String endpoint,
    required String jwtToken,
  }) async {
    /// We're not catching errors here but we will do it in the cubit

    const String path = 'login';

    final Map<String, dynamic> jsonResponse = await client.post(
      url: _getUrl(path, endpoint),
      jsonBody:
          request.copyWith(appId: int.parse(request.appId.toString())).toJson(),
      headers: <String, String>{'Authorization': 'Bearer $jwtToken'},
    );

    return LoginResponseModel.fromJson(jsonResponse);
  }

  String _getUrl(String path, String endpoint) =>
      'https://$endpoint/oauth2/api/v1/$path';
}
