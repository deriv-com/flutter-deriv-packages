import 'package:deriv_auth/deriv_auth.dart';
import 'package:flutter/foundation.dart' show VoidCallback;

/// Reset password page model
class ResetPassPageModel {
  /// Constructor [ResetPassPageModel]
  const ResetPassPageModel({
    required this.onResetPassError,
    required this.residences,
    required this.userResidence,
    this.onResetPassSucceed,
  });

  /// Callback to be called when reset pass fails.
  final ResetPassErrorCallback onResetPassError;

  /// Callback to be called when reset pass succeeds.
  final VoidCallback? onResetPassSucceed;

  /// List of residences to be shown.
  final Future<List<DerivResidenceModel>> residences;

  /// User residence like 'id'
  final String userResidence;
}
