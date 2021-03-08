import Flutter
import UIKit

public class SwiftAnalyticsPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "com.deriv.analytics", binaryMessenger: registrar.messenger())
        let instance = SwiftAnalyticsPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if (call.method == "getWriteKey") {
            self.getRudderStackKey(result: result)
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func getRudderStackKey(result: FlutterResult) {
        
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            let nsDictionary: NSDictionary? = NSDictionary(contentsOfFile: path)
            result(nsDictionary?["com.deriv.analytics.WRITE_KEY"] as! String)
        }
    }
}
