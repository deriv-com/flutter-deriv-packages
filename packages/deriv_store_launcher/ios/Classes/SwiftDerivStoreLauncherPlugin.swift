import Flutter
import UIKit

public class SwiftDerivStoreLauncherPlugin: NSObject, FlutterPlugin {
  let tag = "DERIV_STORE_LUNCHER_PLUGIN"
  
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "deriv_store_launcher", binaryMessenger: registrar.messenger())
    let instance = SwiftDerivStoreLauncherPlugin()
    
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
  
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "openStore" {
      guard let args = call.arguments else {
        result(FlutterError(code: tag, message: "Missing Parameter in method: (\(call.method))", details: nil))

        return
      }

      if let myArgs = args as? [String: Any], let appId = myArgs["app_id"] as? String {
        openStore(appId: appId) {(success) in
          if success {
            result(true)
          } else {
            result(FlutterError(code: "-1", message: "Unknown Error in method: (\(call.method))", details: nil))
          }
        }
      } else {
        result(FlutterError(code: tag, message: "Could not extract flutter arguments in method: (\(call.method))", details: nil))
      }
    } else {
      result(FlutterMethodNotImplemented)
    }
  }
  
  private func openStore(appId: String, _ completion: ((Bool) -> ())?=nil) {
    if let url = URL(string: "itms-apps://itunes.apple.com/app/\(appId)"), UIApplication.shared.canOpenURL(url) {
      if #available(iOS 10.0, *) {
        UIApplication.shared.open(url, options: [:], completionHandler: completion)
      } else {
        let result = UIApplication.shared.openURL(url)

        completion?(result)
      }
    } else {
      completion?(false)
    }
  }
}