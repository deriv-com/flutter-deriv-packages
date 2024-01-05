import Flutter
import UIKit

public class DerivPasskeysPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "deriv_passkeys", binaryMessenger: registrar.messenger())
    let instance = DerivPasskeysPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "createPasskey":
      if #available(iOS 15.0, *) {
        guard let args = call.arguments as? [String: Any],
              let jsonString = args["requestJson"] as? String,
              let jsonData = jsonString.data(using: .utf8),
              let arguments = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] else {
            result(FlutterError(code: "ARGUMENT_ERROR",
                                message: "Failed to parse the arguments",
                                details: nil))
            return
        }

        let challengeString = arguments["challenge"] as? String ?? ""
        let userIDString = arguments["userID"] as? String ?? ""
        
        let passkeyManager = PasskeyManager()
        passkeyManager.createPasskey(challengeString: challengeString, userIDString: userIDString)
        result("Passkey creation initiated")
    } else {
        result(FlutterError(code: "UNAVAILABLE",
                            message: "Passkey creation not available on this iOS version",
                            details: nil))
    }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
