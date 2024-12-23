`Deriv Web View` package contains several helpers to help open `URL that needs authorization` and `normal URL` in the internal or in-app browser.

## Features

- Open URLs in in-app browser and external browser.
- Set `endpoint` and `appId` programmatically (only on in-app browser).
- `OnClose` callback to handle closing of the browser.
- `validateCredentialsOnClosed` callback to validate credentials on closing of the browser.

## Usage

first of all you should add Add `deriv_web_view` dependency to `pubspec.yaml`:

```yaml
deriv_web_view:
  git:
    url: https://github.com/deriv-com/flutter-deriv-packages.git
    path: packages/deriv_web_view
    ref: dev
```

### 1. To open a URL in external browser:

```dart
Future<void> openWebPage({
  required BuildContext context,
  required String url,
  LaunchMode launchMode = LaunchMode.externalApplication,
});
```

- Default launch mode is `externalApplication` which passes the URL to the OS to be handled by another application.

- Available `launchMode` values:

```dart
enum LaunchMode {
  /// Leaves the decision of how to launch the URL to the platform implementation.
  platformDefault,

  /// Loads the URL in an in-app web view (e.g., Safari View Controller).
  inAppWebView,

  /// Passes the URL to the OS to be handled by another application.
  externalApplication,

  /// Passes the URL to the OS to be handled by another non-browser application.
  externalNonBrowserApplication,
}

```

### 2. To open a URL in in-app browser:

```dart
Future<void> openInAppWebView({
  required BuildContext context,
  required String url,
  String? title,
  bool extendBodyBehindAppBar = false,
  bool setEndpoint = false,
  bool rootNavigator = false,
  String? endpoint,
  String? appId,
  VoidCallback? onClosed,
});
```

- `extendBodyBehindAppBar` if true, the body of the page will be extended behind the app bar, default is false.
- By setting `setEndpoint` to true, you can set `endpoint` and `appId` programmatically.
- `onClosed` callback to handle closing of the browser.

### 3. Open logged in URLs:

```dart
Future<void> openLoggedInWebPage({
  required BuildContext context,
  required String redirectPath,
  required String endpoint,
  required String appId,
  required String? refreshToken,
  required String? defaultAccount,
  required void Function(BuildContext context) loadingDialog,
  required Future<void> Function(BuildContext context) tokenExpiredDialog,
  required bool rootNavigator,
  String destinationAppId = '16929',
  String? action,
  String? code,
  String title = '',
  bool validateCredentialsOnClosed = false,
  VoidCallback? onClosed,
  bool inAppBrowser = true,
})
```

- `redirectPath` is the path to a page that needs authorization to be open, this path will be provide by `Front-End` team.

```
error404: '/404'
account: '/account'
financial_assessment: '/account/financial-assessment'
personal_details: '/account/personal-details'
proof_of_identity: '/account/proof-of-identity'
proof_of_address: '/account/proof-of-address'
passwords: '/account/passwords'
deactivate_account: '/account/deactivate-account'
account_deactivated: '/account-deactivated'
account_limits: '/account/account-limits'
connected_apps: '/account/connected-apps'
api_token: '/account/api-token'
login_history: '/account/login-history'
two_factor_authentication: '/account/two-factor-authentication'
self_exclusion: '/account/self-exclusion'
account_password: '/settings/account_password'
apps: '/settings/apps'
cashier_password: '/settings/cashier_password'
contract: '/contract/:contract_id'
exclusion: '/settings/exclusion'
financial: '/settings/financial'
history: '/settings/history'
index: '/index'
limits: '/settings/limits'
mt5: '/mt5'
dxtrade: '/derivx'
personal: '/settings/personal'
positions: '/reports/positions'
profit: '/reports/profit'
reports: '/reports'
root: '/'
redirect: '/redirect'
settings: '/settings'
statement: '/reports/statement'
token: '/settings/token'
trade: '/'
bot: '/bot'
cashier: '/cashier'
cashier_deposit: '/cashier/deposit'
cashier_withdrawal: '/cashier/withdrawal'
cashier_pa: '/cashier/payment-agent'
cashier_acc_transfer: '/cashier/account-transfer'
cashier_crypto_transactions: '/cashier/crypto-transactions'
// cashier_offramp: '/cashier/off-ramp'
cashier_onramp: '/cashier/on-ramp'
cashier_p2p: '/cashier/p2p'
cashier_p2p_verification: '/cashier/p2p/verification'
cashier_pa_transfer: '/cashier/payment-agent-transfer'
smarttrader: getUrlSmartTrader()
binarybot: getUrlBinaryBot()
endpoint: '/endpoint'
complaints_policy: '/complaints-policy'

dashboard: '/dashboard'
my_apps: '/dashboard/my-apps'
about_us: '/dashboard/about-us'
explore: '/dashboard/explore'
resources: '/dashboard/resources'

market_commodities: '/dashboard/markets/commodities'
market_forex: '/dashboard/markets/forex'
market_stock: '/dashboard/markets/stock'
market_synthetic: '/dashboard/markets/synthetic'
markets: '/dashboard/markets'

platform_binary_bot: '/dashboard/platforms/binary-bot'
platform_dbot: '/dashboard/platforms/dbot'
platform_dmt5: '/dashboard/platforms/dmt5'
platform_dmt5_financial: '/dashboard/platforms/dmt5-financial'
platform_dmt5_financial_stp: '/dashboard/platforms/dmt5-financial-stp'
platform_dmt5_synthetic: '/dashboard/platforms/dmt5-synthetic'
platform_dtrader: '/dashboard/platforms/dtrader'
platform_smarttrader: '/dashboard/platforms/smarttrader'
platforms: '/dashboard/platforms'

trade_type_cfds: '/dashboard/trade-types/cfds'
trade_type_multipliers: '/dashboard/trade-types/multipliers'
trade_type_options: '/dashboard/trade-types/options'
trade_types: '/dashboard/trade-types'

wallet_bank_wire: '/dashboard/wallets/bank-wire'
wallet_cards: '/dashboard/wallets/cards'
wallet_crypto: '/dashboard/wallets/crypto'
wallet_ewallet: '/dashboard/wallets/ewallet'
wallets: '/dashboard/wallets'
```

- `destinationAppId` is the id of the destination app that will be used to open the URL, default is `16929`.
- `refreshToken` is the app token, default is `null`.
- `defaultAccount` is the app default account that is already logged in, default is `null`.
- `loadingDialog` should be a dialog that will be shown while the URL is loading.
- `tokenExpiredDialog` should be a dialog that will be shown when the token is expired or token is not valid.
- `validateCredentialsOnClosed` if true, the credentials will be validated when the browser is closed, default is false.
- `onClosed` callback to handle closing of the browser.
- `inAppBrowser` if true, the browser will be opened in an in-app browser, default is true.

## Example

Here is a example for `Account Deactivation`:

```dart
openLoggedInWebPage(
  context: context,
  redirectPath: 'deactivate_account',
  endpoint: endpoint,
  appId: appId,
  refreshToken: refreshToken,
  defaultAccount: defaultAccount,
  loadingDialog: showSimpleLoadingDialog,
  tokenExpiredDialog: showTokenExpiredDialog,
  validateCredentialsOnClosed: true,
);

Future<void> showSimpleLoadingDialog(BuildContext context) =>
    Future<void>.delayed(
      Duration.zero,
      () async {
        await showDialog<LoadingIndicator>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => Center(
            child: Container(
              height: 72,
              width: 72,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(child: LoadingIndicator()),
            ),
          ),
        );
      },
    );

Future<void> showTokenExpiredDialog(BuildContext context) => showAlertDialog(
  context: context,
  title: 'Logged Out',
  content: Text('Session Expired'),
  positiveActionLabel: 'Log In',
  dismissible: false,
  onPositiveActionPressed: () { ... }, // Redirect to login page.
);
```
