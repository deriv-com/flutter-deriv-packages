import 'package:equatable/equatable.dart';

/// A Dart class that contains the response to verify credentials.
final class DerivPasskeysVerifyCredentialsResponseModel extends Equatable {
  /// Creates a [DerivPasskeysVerifyCredentialsResponseModel].
  const DerivPasskeysVerifyCredentialsResponseModel({
    required this.response,
  });

  /// contains the response from the REST API to verify credentials.
  final Map<String, dynamic> response;

  @override
  List<Object?> get props => <Object?>[response];
}
