import Flutter
import UIKit

public class SwiftDerivStoreLauncherPlugin: NSObject, FlutterPlugin {
    private let tag = "DERIV_STORE_LAUNCHER_PLUGIN"

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "deriv_store_launcher", binaryMessenger: registrar.messenger())
        let instance = SwiftDerivStoreLauncherPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments as? [String: Any] else {
            result(FlutterError(code: tag, message: "Missing parameters in method: \(call.method)", details: nil))
            return
        }

        switch call.method {
        case "isAppInstalled":
            handleIsAppInstalled(args["package_name"] as? String, result: result)

        case "openStore":
             handleOpenStore(args["ios_app_store_id"] as? String, result: result)

        case "openApp":
            handleOpenApp(
                urlScheme: args["package_name"] as? String,
                appStoreId: args["ios_app_store_id"] as? String,
                shouldOpenStore: args["open_store"] as? String,
                result: result
            )

        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func handleIsAppInstalled(_ urlScheme: String?, result: @escaping FlutterResult) {
        guard let urlScheme = urlScheme, let url = URL(string: urlScheme) else {
            result(false)
            return
        }
        result(UIApplication.shared.canOpenURL(url))
    }

    private func handleOpenStore(_ appStoreId: String?, result: @escaping FlutterResult) {
        guard let appStoreId = appStoreId else {
            result(FlutterError(code: tag, message: "Missing appStoreId", details: nil))
            return
        }
        openAppStore(appStoreId: appStoreId, result: result)
    }


    private func handleOpenApp(urlScheme: String?, appStoreId: String?, shouldOpenStore: String?, result: @escaping FlutterResult) {
        guard let urlScheme = urlScheme, let appStoreId = appStoreId, let shouldOpenStore = shouldOpenStore else {
            result(FlutterError(code: tag, message: "Missing required arguments", details: nil))
            return
        }

        guard let url = URL(string: urlScheme) else {
            if shouldOpenStore == "true" {
                openAppStore(appStoreId: appStoreId, result: result)
            } else {
                result(false)
            }
            return
        }

        openURL(url) { success in
            if !success && shouldOpenStore == "true" {
                self.openAppStore(appStoreId: appStoreId, result: result)
            } else {
                result(success)
            }
        }
    }


    private func openURL(_ url: URL, completion: @escaping (Bool) -> Void) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:]) { success in
                completion(success)
            }
        } else {
            completion(UIApplication.shared.openURL(url))
        }
    }


    private func openAppStore(appStoreId: String, result: @escaping FlutterResult) {
        let appStoreURLString = "itms-apps://itunes.apple.com/app/\(appStoreId)" // Or "https://apps.apple.com/app/\(appStoreId)"
        guard let url = URL(string: appStoreURLString) else {
            result(FlutterError(code: tag, message: "Invalid App Store URL", details: nil))
            return
        }

        openURL(url) { success in
            result(success)
        }
    }
}