import Flutter
import UIKit

public class SwiftFlutterDerivBlocManagerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_deriv_bloc_manager", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterDerivBlocManagerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
