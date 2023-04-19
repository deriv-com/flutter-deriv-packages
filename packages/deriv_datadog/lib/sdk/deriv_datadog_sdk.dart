import 'package:deriv_datadog/datadog.dart';

/// A class that implements the `BaseDatadogSdk` interface.
class DerivDatadogSDK implements BaseDatadogSdk {

  /// A factory constructor to return the `_instance` of `DerivDatadogSDK`.
  factory DerivDatadogSDK() => _instance;

  /// A private constructor which initializes the `_sdk` instance variable to the `DatadogSdk` instance.
  DerivDatadogSDK._() : _sdk = DatadogSdk.instance;

  /// A private static instance of the `DerivDatadogSDK` class.
  static final DerivDatadogSDK _instance = DerivDatadogSDK._();

  /// An instance of the `DatadogSdk` class.
  final DatadogSdk _sdk;

  /// A getter method to get the SDK instance.
  DatadogSdk get sdk => _sdk;

  /// A method to get the `DatadogNavigationObserver` instance.
  DatadogNavigationObserver get navigationObserver => DatadogNavigationObserver(datadogSdk: _sdk);

  /// A method to set user information.
  ///
  /// This method sets user information in the Datadog SDK.
  @override
  void setUserInfo({
    String? id,
    String? name,
    String? email,
    Map<String, Object> extraInfo = const <String, Object> {},
  }) {
    _sdk.setUserInfo(id: id, name: name, email: email, extraInfo: extraInfo);
  }

  /// A method to log a tap event.
  ///
  /// This method logs a user's tap event with the given `name`.
  @override
  void tapEvent(String name) {
    _sdk.rum?.addUserAction(RumUserActionType.tap, name);
  }

  /// A method to log a scroll event.
  ///
  /// This method logs a user's scroll event with the given `name`.
  @override
  void scrollEvent(String name) {
    _sdk.rum?.addUserAction(RumUserActionType.scroll, name);
  }

  /// A method to log a swipe event.
  ///
  /// This method logs a user's swipe event with the given `name`.
  @override
  void swipeEvent(String name) {
    _sdk.rum?.addUserAction(RumUserActionType.swipe, name);
  }

  /// A method to log a custom event.
  ///
  /// This method logs a custom user event with the given `name`.
  @override
  void customEvent(String name) {
    _sdk.rum?.addUserAction(RumUserActionType.custom, name);
  }

  /// A method to log errors.
  ///
  /// This method logs an error message with the given `message`.
  @override
  void sourceError(String message) {
    _sdk.rum?.addErrorInfo(message, RumErrorSource.source);
  }

  /// A method to start the Datadog SDK.
  ///
  /// This method takes an instance of `DatadogSdkConfig` and an `AppRunner` function as arguments.
@override
  Future<void> runApp(DatadogSdkConfig config, AppRunner runner) async {
    final DdSdkConfiguration configuration = DdSdkConfiguration(
        clientToken: config.clientToken,
        env: config.env ?? 'production',
        serviceName: 'deriv.com',
        site: DatadogSite.us1,
        trackingConsent: config.trackingConsent.consent,
        nativeCrashReportEnabled: config.nativeCrashReportEnabled ?? true,
        loggingConfiguration: LoggingConfiguration(),
        rumConfiguration: RumConfiguration(
            applicationId: config.applicationId,
            sessionSamplingRate: config.sessionSamplingRate ?? 10,
        ),
    );

    await DatadogSdk.runApp(configuration,runner);
}
}
