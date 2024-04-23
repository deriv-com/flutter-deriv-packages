/// Pass-through login request model.
class PtaLoginRequestModel {
  /// Initializes Pass-through Login request model.
  PtaLoginRequestModel({
    required this.refreshToken,
    required this.appId,
    required this.urlParams,
  });

  /// JWT Refresh token.
  final String refreshToken;

  /// App id. Which the user will be redirected to.
  final String appId;

  /// URL params.
  final UrlParamsModel urlParams;

  /// Converts a instance of this class to json.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'refresh_token': refreshToken,
        'app_id': appId,
        'url_params': urlParams.toJson(),
      };
}

/// URL params model.
class UrlParamsModel {
  /// Initializes URL params model.
  UrlParamsModel({
    required this.redirectUrl,
    required this.selectedAccount,
    required this.platform,
    this.action,
    this.code,
  });

  /// URL that user should be redirected to for example `/cashier`.
  final String redirectUrl;

  /// Login Id of account.
  final String selectedAccount;

  /// Platform.
  final String platform;

  /// The action that caused redirect for example `passthrough_authentication`.
  final String? action;

  /// Code.
  final String? code;

  /// Converts a instance of this class to json.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'redirect_url': redirectUrl,
        'selected_acct': selectedAccount,
        if (action != null) 'action': action,
        if (code != null) 'code': code,
        'platform': platform,
      };
}
