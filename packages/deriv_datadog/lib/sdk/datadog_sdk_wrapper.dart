import 'package:deriv_datadog/datadog.dart';

class DatadogSdkWrapper implements IDatadogSdk {

  static final _instance = DatadogSdkWrapper._();
  final DatadogSdk _sdk;

  DatadogSdkWrapper._() : _sdk = DatadogSdk.instance;

  factory DatadogSdkWrapper() => _instance;

  DatadogSdk get sdk => _sdk;

  DatadogNavigationObserver get navigationObserver => DatadogNavigationObserver(datadogSdk: _sdk);

  @override
  void setUserInfo({
    String? id,
    String? name,
    String? email,
    Map<String, Object> extraInfo = const {},
  }) {
    _sdk.setUserInfo(id: id, name: name, email: email, extraInfo: extraInfo);
  }

  @override
  void tapEvent(String name) {
    _sdk.rum?.addUserAction(RumUserActionType.tap, name);
  }

  @override
  void scrollEvent(String name) {
    _sdk.rum?.addUserAction(RumUserActionType.scroll, name);
  }

  @override
  void swipeEvent(String name) {
    _sdk.rum?.addUserAction(RumUserActionType.swipe, name);
  }

  @override
  void customEvent(String name) {
    _sdk.rum?.addUserAction(RumUserActionType.custom, name);
  }

  @override
  void sourceError(String message) {
    _sdk.rum?.addErrorInfo(message, RumErrorSource.source);
  }

  @override
  Future<void> runApp(DatadogSdkConfig config, AppRunner runner) async {


    final configuration = DdSdkConfiguration(
      clientToken: config.clientToken,
      env: config.env ?? "production",
      serviceName: "deriv.com",
      site: DatadogSite.us1,
      trackingConsent: config.trackingConsent.consent,
      nativeCrashReportEnabled: config.nativeCrashReportEnabled ?? true,
      
      loggingConfiguration: LoggingConfiguration(

      ),
      rumConfiguration: RumConfiguration(
        applicationId: config.applicationId,
        sessionSamplingRate: config.sessionSamplingRate ?? 10,
        detectLongTasks: true,
        
        ),
    );

    await DatadogSdk.runApp(configuration, () async {
      runner();
    });
  }
}
