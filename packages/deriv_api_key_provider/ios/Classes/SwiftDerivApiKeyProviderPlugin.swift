import Flutter
import UIKit

public class SwiftDerivApiKeyProviderPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "deriv_api_key_provider", binaryMessenger: registrar.messenger())
    let instance = SwiftDerivApiKeyProviderPlugin()

    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
  }
}
