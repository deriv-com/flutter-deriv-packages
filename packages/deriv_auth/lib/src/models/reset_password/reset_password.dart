import '../../core/helpers/bool_helper.dart';

/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/reset_password_send.json.

// ignore_for_file: always_put_required_named_parameters_first

/// Reset password request class.
class ResetPasswordRequestEntity {
  /// Initialize ResetPasswordRequestEntity.
  const ResetPasswordRequestEntity({
    this.dateOfBirth,
    required this.newPassword,
    this.resetPassword = true,
    required this.verificationCode,
    this.passthrough,
    this.reqId,
  });

  ///! These are inherited from Request class from API package
  ///!
  final String msgType = 'verify_email';
  final Map<String, dynamic>? passthrough;
  final int? reqId;

  ///!

  /// Creates an instance from JSON.
  factory ResetPasswordRequestEntity.fromJson(Map<String, dynamic> json) =>
      ResetPasswordRequestEntity(
        dateOfBirth: json['date_of_birth'] as String?,
        newPassword: json['new_password'] as String?,
        resetPassword:
            json['reset_password'] == null ? null : json['reset_password'] == 1,
        verificationCode: json['verification_code'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Date of birth format: `yyyy-mm-dd`. Only required for clients with real-money accounts.
  final String? dateOfBirth;

  /// New password. For validation (Accepts any printable ASCII character. Must be within 8-25 characters, and include numbers, lowercase and uppercase letters. Must not be the same as the user's email address).
  final String? newPassword;

  /// Must be `true`
  final bool? resetPassword;

  /// Email verification code (received from a `verify_email` call, which must be done first)
  final String? verificationCode;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'date_of_birth': dateOfBirth,
        'new_password': newPassword,
        'reset_password': resetPassword == null
            ? null
            : resetPassword!
                ? 1
                : 0,
        'verification_code': verificationCode,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ResetPasswordRequestEntity copyWith({
    String? dateOfBirth,
    String? newPassword,
    bool? resetPassword,
    String? verificationCode,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      ResetPasswordRequestEntity(
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        newPassword: newPassword ?? this.newPassword,
        resetPassword: resetPassword ?? this.resetPassword,
        verificationCode: verificationCode ?? this.verificationCode,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}

///
///
///
///
///

/// Reset password response model class.
abstract class ResetPasswordResponseModel {
  /// Initializes Reset password response model class .
  const ResetPasswordResponseModel({
    this.resetPassword,
  });

  /// `true`: password reset success, `false`: password reset failure
  final bool? resetPassword;
}

/// Reset password response class.
class ResetPasswordResponseEntity extends ResetPasswordResponseModel {
  /// Initializes Reset password response class.
  const ResetPasswordResponseEntity({
    bool? resetPassword,
  }) : super(
          resetPassword: resetPassword,
        );

  /// Creates an instance from JSON.
  factory ResetPasswordResponseEntity.fromJson(
    dynamic resetPasswordJson,
  ) =>
      ResetPasswordResponseEntity(
        resetPassword: getBool(resetPasswordJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['reset_password'] = resetPassword;

    return resultMap;
  }

  /// Reset the password of User.
  // static Future<ResetPasswordResponse> reset(
  //   ResetPasswordRequest request,
  // ) async {
  //   final ResetPasswordReceive? response =
  //       await _api!.call<ResetPasswordReceive>(request: request);

  //   checkException(
  //     response: response,
  //     exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
  //         UserException(baseExceptionModel: baseExceptionModel),
  //   );

  //   return ResetPasswordResponse.fromJson(response?.resetPassword);
  // }

  /// Creates a copy of instance with given parameters.
  ResetPasswordResponseEntity copyWith({
    bool? resetPassword,
  }) =>
      ResetPasswordResponseEntity(
        resetPassword: resetPassword ?? this.resetPassword,
      );
}
