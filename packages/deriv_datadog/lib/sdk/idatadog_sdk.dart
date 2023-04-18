import 'package:deriv_datadog/datadog.dart';

abstract class IDatadogSdk {
  void setUserInfo({
    String? id,
    String? name,
    String? email,
    Map<String, Object> extraInfo = const {},
  });

  void tapEvent(String name);

  void scrollEvent(String name);

  void swipeEvent(String name);

  void customEvent(String name);

  void sourceError(String message);

  Future<void> runApp(DatadogSdkConfig config, AppRunner runner);
}