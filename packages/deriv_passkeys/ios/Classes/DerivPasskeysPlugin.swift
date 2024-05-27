import Flutter
import UIKit

public class DerivPasskeysPlugin: NSObject, FlutterPlugin {

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "deriv_passkeys", binaryMessenger: registrar.messenger())
    let instance = DerivPasskeysPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

    switch call.method {
    case "isPlatformSupported":
      if #available(iOS 15.0, *) {
        result(true)
      } else {
        result(false)
      }
    case "createCredential":
      if #available(iOS 15.0, *) {
        let derivPasskeysManager = DerivPasskeysManager()
        if let args = call.arguments as? [String: Any], let options = args["options"] as? String {
          derivPasskeysManager.createCredential(options) { credential, error in
            if let err = error {
              let errorCode = (err as NSError).code
              result(FlutterError(code: String(errorCode), message: "\(err)", details: nil))
              return
            }
            result(credential!)
          }
        } else {
          result(
            FlutterError(code: "CreateCredentialError", message: "Options not found", details: nil))
        }
      } else {
        result(
          FlutterError(
            code: "UNAVAILABLE",
            message: "Passkey creation not available on this iOS version",
            details: nil))
      }
    case "getCredential":
      if #available(iOS 15.0, *) {
        let derivPasskeysManager = DerivPasskeysManager()
        if let args = call.arguments as? [String: Any], let options = args["options"] as? String {
          derivPasskeysManager.getCredential(options) { credential, error in
            if let err = error {
              let errorCode = (err as NSError).code
              result(FlutterError(code: String(errorCode), message: "\(err)", details: nil))
              return
            }
            result(credential!)
          }
        } else {
          result(
            FlutterError(code: "GetCredentialError", message: "Options not found", details: nil))
        }
      } else {
        result(
          FlutterError(
            code: "UNAVAILABLE",
            message: "Passkey retrieval not available on this iOS version",
            details: nil))
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
