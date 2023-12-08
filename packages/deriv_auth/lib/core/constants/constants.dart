/// Error occurs if expired/invalid jwt-token is passed in the login request.
const String invalidJwtTokenError = 'INVALID_TOKEN';

/// Error occurs if 2FA is not passed in the login request.
const String missingOTPError = 'MISSING_ONE_TIME_PASSWORD';

/// Error occurs if invalid 2FA code is passed in the login request.
const String invalidAuthCodeError = 'TFA_FAILURE';

/// Error occurs if invalid credential is passed in `system` login.
const String invalidCredentialError = 'INVALID_CREDENTIALS';

/// Error occurs if account has been flagged as `self_closed`.
const String selfClosedError = 'SELF_CLOSED';

/// Error occurs if tries to login on deactivated account.
const String accountUnavailableError = 'AccountUnavailable';

/// Error occurs if tries to login from unsupported country.
const String invalidResidence = 'INVALID_RESIDENCE';

/// Error message when user's country is not accepted.
const String notAvailableCountryMessage =
    'This service is not available in your country.';

/// Live Chat licence id.
const String liveChatLicenseId = '12049137';

/// Live Chat group id.
const String liveChatGroupId = '91';

/// The order of the currencies to be shown.
const List<String> currenciesDisplayOrder = <String>[
  'USD',
  'EUR',
  'GBP',
  'AUD',
  'BTC',
  'ETH',
  'LTC',
  'USDC',
  'UST',
  'eUSDT',
  'BUSD',
  'DAI',
  'EURS',
  'IDK',
  'PAX',
  'TUSD',
  'USDK',
];

/// Default asset symbol name.
const String defaultAssetSymbol = '1HZ100V';

/// Used when resetting password.
const String resetPasswordEmailType = 'reset_password';

/// Used when opening new account.
const String accountOpeningEmailType = 'account_opening';

/// Supported date format when signing up.
const String dateFormat = 'yyyy-MM-dd';
