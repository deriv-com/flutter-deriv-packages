import 'package:deriv_auth/core/helpers/bool_helper.dart';
import 'package:equatable/equatable.dart';

/// Verify email request class.
class VerifyEmailRequestEntity with EquatableMixin {
  /// Initialize [VerifyEmailRequestEntity].
  VerifyEmailRequestEntity({
    required this.type,
    required this.verifyEmail,
    this.urlParameters,
    this.passthrough,
    this.reqId,
  });

  /// Creates an instance from JSON.
  factory VerifyEmailRequestEntity.fromJson(Map<String, dynamic> json) =>
      VerifyEmailRequestEntity(
        type: json['type'] as String?,
        urlParameters: json['url_parameters'] as Map<String, dynamic>?,
        verifyEmail: json['verify_email'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Purpose of the email verification call.
  final String? type;

  /// [Optional] Extra parameters that can be attached to the verify email link URL.
  final Map<String, dynamic>? urlParameters;

  /// Email address to be verified.
  final String? verifyEmail;

  /// These are inherited from Request class from API package.
  ///
  /// Message Type.
  final String msgType = 'verify_email';

  /// Passthrough extra data.
  final Map<String, dynamic>? passthrough;

  /// Request ID.
  final int? reqId;

  /// Converts this instance to JSON
  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'url_parameters': urlParameters,
        'verify_email': verifyEmail,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  VerifyEmailRequestEntity copyWith({
    String? type,
    Map<String, dynamic>? urlParameters,
    String? verifyEmail,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      VerifyEmailRequestEntity(
        type: type ?? this.type,
        urlParameters: urlParameters ?? this.urlParameters,
        verifyEmail: verifyEmail ?? this.verifyEmail,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[
        verifyEmail,
      ];
}

/// Verify email response model class.
abstract class VerifyEmailResponseModel {
  /// Initializes Verify email response model class .
  const VerifyEmailResponseModel({
    this.verifyEmail,
  });

  /// 1 for success (secure code has been sent to the email address)
  final bool? verifyEmail;
}

/// Verify email response class.
class VerifyEmailResponseEntity extends VerifyEmailResponseModel {
  /// Initializes Verify email response class.
  const VerifyEmailResponseEntity({
    bool? verifyEmail,
  }) : super(
          verifyEmail: verifyEmail,
        );

  /// Creates an instance from JSON.
  factory VerifyEmailResponseEntity.fromJson(
    dynamic verifyEmailJson,
  ) =>
      VerifyEmailResponseEntity(
        verifyEmail: getBool(verifyEmailJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['verify_email'] = verifyEmail;

    return resultMap;
  }

  /// Verifies an email address for various purposes.
  ///
  /// The system will send an email to the address containing a security code for verification.
  /// For parameters information refer to [VerifyEmailRequest].
  /// Throws a [UserException] if API response contains an error
  // static Future<VerifyEmailResponse> verify(
  //   VerifyEmailRequest request,
  // ) async {
  //   final VerifyEmailReceive response = await _api.call(request: request);

  //   checkException(
  //     response: response,
  //     exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
  //         UserException(baseExceptionModel: baseExceptionModel),
  //   );

  //   return VerifyEmailResponse.fromJson(response.verifyEmail);
  // }

  /// Creates a copy of instance with given parameters.
  VerifyEmailResponseEntity copyWith({
    bool? verifyEmail,
  }) =>
      VerifyEmailResponseEntity(
        verifyEmail: verifyEmail ?? this.verifyEmail,
      );
}
