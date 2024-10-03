import Flutter
import LiveChat
import UIKit

/** DerivLiveChatPlugin */
public class SwiftDerivLiveChatPlugin: NSObject, FlutterPlugin, LiveChatDelegate, FlutterStreamHandler {
    private var lifecycleSink: FlutterEventSink?

    public static func register(with registrar: FlutterPluginRegistrar) {
        /// Register Channel.
        let _liveChatMethodChannel = FlutterMethodChannel(name: "deriv_live_chat", binaryMessenger: registrar.messenger())
        let instance = SwiftDerivLiveChatPlugin()

        registrar.addMethodCallDelegate(instance, channel: _liveChatMethodChannel)

        /// Register Event.
        let _liveChatEventChannel = FlutterEventChannel(name: "deriv_live_chat_event_listener", binaryMessenger: registrar.messenger())

        _liveChatEventChannel.setStreamHandler(instance.self)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
            case "open_live_chat_view":
                let arguments = call.arguments as! [String: Any]
                let licenseId = (arguments["licenseId"] as? String)
                let visitorName = (arguments["visitorName"] as? String)
                let visitorEmail = (arguments["visitorEmail"] as? String)
                let groupId = (arguments["groupId"] as? String)
                let customParams = (arguments["customParams"] as! [String: String])

                if licenseId == "" {
                    result(FlutterError(code: "", message: "LICENSE NUMBER EMPTY", details: nil))
                } else {
                    LiveChat.licenseId = licenseId
                    LiveChat.name = visitorName
                    LiveChat.email = visitorEmail
                    LiveChat.groupId = groupId

                    for (key, value) in customParams {
                        LiveChat.setVariable(withKey: key, value: value)
                    }

                    LiveChat.delegate = self
                    LiveChat.customPresentationStyleEnabled = false
                    
                    LiveChat.presentChat()

                    //Change colour of top and bottom notch for dark theme.
                    let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
                     UIView.transition(with: window!.rootViewController!.view, duration: 1, options: .transitionCrossDissolve, animations: {
                     let colorComponent = 37.0 / 255.0
                     window?.rootViewController?.view.backgroundColor = UIColor(red: colorComponent, green: colorComponent, blue: colorComponent, alpha: 1)}, completion: nil)
                    
                    result(nil)
                }
            case "close_live_chat_view":
                
                result(nil)
            case "clear_live_chat_view":
                LiveChat.clearSession()
                result(nil)
            case "reload_live_chat_view":
                 LiveChat.dismissChat()
                 result(nil)

            default:
                result(FlutterMethodNotImplemented)
        }
    }

    /// iOS Live Chat delegate method to call Message received event (Method provided by Livechat plugin).
    public func received(message: LiveChatMessage) {
        lifecycleSink?(message.text)
    }

    /// Handle chat presented here (Method provided by Livechat plugin).
    public func chatPresented() {
        lifecycleSink?("chatOpen")
    }

    /// Handle chat dismissed here (Method provided by Livechat plugin).
    public func chatDismissed() {
        lifecycleSink?("chatClose")
    }

    /// On listen event.
    public func onListen(withArguments _: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        lifecycleSink = events

        return nil
    }

    /// On cancel event.
    public func onCancel(withArguments _: Any?) -> FlutterError? {
        lifecycleSink = nil

        return nil
    }
}
