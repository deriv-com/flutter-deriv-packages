abstract class ITokenRepo {
  Future<String> getJwtToken({required String appId, required String endpoint});
}
