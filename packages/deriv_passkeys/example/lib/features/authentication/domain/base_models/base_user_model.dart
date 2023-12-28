abstract class BaseUserModel {
  final String id;
  final String email;
  final String? name;
  final String? password;

  BaseUserModel({
    required this.id,
    required this.email,
    this.name,
    this.password,
  });

}
