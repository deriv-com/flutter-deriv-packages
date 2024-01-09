import Flutter
import UIKit
import AuthenticationServices

public class DerivPasskeysPlugin: NSObject, FlutterPlugin {
    
    
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "deriv_passkeys", binaryMessenger: registrar.messenger())
        let instance = DerivPasskeysPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

        let derivPasskeysManager = DerivPasskeysManager()

        switch call.method {
        case "getPlatformVersion":
            result(getPlatformVersion())
        case "createCredential":
        if #available(iOS 15.0, *) {
            if let args = call.arguments as? Dictionary<String, Any>, let options = args["options"] as? String {
                derivPasskeysManager.createCredential(options) { credential, error in
                    if let err = error {
                        result(FlutterError(code: String(describing: type(of: err)), message: "\(err)", details: nil))
                        return
                    }
                    result(credential!)
                }
            }
            else {
                result(FlutterError(code: "CreateCredentialError", message: "Options not found", details: nil))
            }
            } else {
        result(FlutterError(code: "UNAVAILABLE",
                            message: "Passkey creation not available on this iOS version",
                            details: nil))
    }
        case "getCredential":
        if #available(iOS 15.0, *) {
            if let args = call.arguments as? Dictionary<String, Any>, let options = args["options"] as? String {
                derivPasskeysManager.getCredential(options) { credential, error in
                    if let err = error {
                        result(FlutterError(code: String(describing: type(of: err)), message: "\(err)", details: nil))
                        return
                    }
                    result(credential!)
                }
            }
            else {
                result(FlutterError(code: "GetCredentialError", message: "Options not found", details: nil))
            }
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

