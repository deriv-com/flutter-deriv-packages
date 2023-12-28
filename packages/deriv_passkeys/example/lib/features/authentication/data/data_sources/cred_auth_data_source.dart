import 'package:passkeys_poc/features/authentication/data/data_sources/base_auth_data_source.dart';
import 'package:passkeys_poc/features/authentication/data/models/user_model.dart';

class CredAuthDataSource implements BaseAuthDataSource<UserModel, UserModel>{
  const CredAuthDataSource();

  @override
  Future<UserModel> login({
    required UserModel data
  }) async{
    return UserModel(
      id: "1",
      email: data.email,
      name: data.name
    );
  }

  @override
  Future<UserModel> signup({
    required UserModel data,
  }) async{
    return UserModel(
      id: "1",
      email: data.email,
      name: data.name
    );
  }

  @override
  Future logout() async{

  }
}