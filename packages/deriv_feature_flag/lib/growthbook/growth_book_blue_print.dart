import 'package:growthbook_sdk_flutter/growthbook_sdk_flutter.dart';

/// The class that handles GrowthBook SDK functionalities.
abstract class GrowthBookBluePrint {
  /// Class constructor that creates an instance of Growth Book SDK builder.
  GrowthBookBluePrint();

  /// initialize the sdk.
  Future<GrowthBookSDK> initializeSDK();
}
