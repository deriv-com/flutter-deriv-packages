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
            case "derivLiveChatView":
                let arguments = call.arguments as! [String: Any]
                let licenseNo = (arguments["licenseNo"] as? String)
                let visitorName = (arguments["visitorName"] as? String)
                let visitorEmail = (arguments["visitorEmail"] as? String)
                let groupId = (arguments["groupId"] as? String)
                let customParams = (arguments["customParams"] as! [String: String])

                if licenseNo == "" {
                    result(FlutterError(code: "", message: "LICENSE NUMBER EMPTY", details: nil))
                } else if visitorName == "" {
                    result(FlutterError(code: "", message: "VISITOR NAME EMPTY", details: nil))
                } else if visitorEmail == "" {
                    result(FlutterError(code: "", message: "VISITOR EMAIL EMPTY", details: nil))
                } else {
                    LiveChat.licenseId = licenseNo // Here Set your licence number here.
                    LiveChat.name = visitorName // You can provide customer name or email if they are known, so a customer will not need to fill out the pre-chat survey.
                    LiveChat.email = visitorEmail // You can provide customer name or email if they are known, so a customer will not need to fill out the pre-chat survey.
                    LiveChat.groupId = groupId // Optionally, You can route your customers to specific group of agents by providing groupId.

                    for (key, value) in customParams {
                        LiveChat.setVariable(withKey: key, value: value)
                    }

                    LiveChat.delegate = self
                    LiveChat.customPresentationStyleEnabled = false
                    
                    LiveChat.presentChat()

                    result(nil)
                }
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

    /// on Listen Events
    public func onListen(withArguments _: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        lifecycleSink = events

        return nil
    }

    /// on cancel Events
    public func onCancel(withArguments _: Any?) -> FlutterError? {
        lifecycleSink = nil

        return nil
    }
}
