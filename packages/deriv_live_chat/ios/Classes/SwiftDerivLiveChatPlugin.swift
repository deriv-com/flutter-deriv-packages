import Flutter
import UIKit
import LiveChat


/** DerivLiveChatPlugin */
public class SwiftDerivLiveChatPlugin: NSObject, FlutterPlugin, LiveChatDelegate, FlutterStreamHandler {

     private var lifecycleSink: FlutterEventSink?
 
     public static func register(with registrar: FlutterPluginRegistrar) {
     // Register Channel
        let channel = FlutterMethodChannel(name: "derivLiveChat", binaryMessenger: registrar.messenger())
        let instance = SwiftDerivLiveChatPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        
     // Register Event
       let eventChannel = FlutterEventChannel(name: "derivLiveChatStream", binaryMessenger: registrar.messenger())
        eventChannel.setStreamHandler(instance.self)

    }
 

  
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
   
     switch call.method {
       
        case "DerivLiveChatView":
            let arguments = call.arguments as! [String:Any]
            let licenseNo = (arguments["licenseNo"] as? String)
            let groupId = (arguments["groupId"] as? String)
            let visitorName = (arguments["visitorName"] as? String)
            let visitorEmail = (arguments["visitorEmail"] as? String)
            let customParams = (arguments["customParams"] as! [String:String])

            if (licenseNo == ""){
                result(FlutterError(code: "", message: "LICENSE NUMBER EMPTY", details: nil))
            }else if (visitorName == ""){
                result(FlutterError(code: "", message: "VISITOR NAME EMPTY", details: nil))
            }else if (visitorEmail == ""){
                 result(FlutterError(code: "", message: "VISITOR EMAIL EMPTY", details: nil))
            }else{
                LiveChat.licenseId = licenseNo // here Set your licence number here
                LiveChat.groupId = groupId // Optionally, You can route your customers to specific group of agents by providing groupId
                LiveChat.name = visitorName // You can provide customer name or email if they are known, so a customer will not need to fill out the pre-chat survey:
                LiveChat.email = visitorEmail // You can provide customer name or email if they are known, so a customer will not need to fill out the pre-chat survey:
                for (key, value) in customParams{
                  LiveChat.setVariable(withKey:key, value:value)}
                 LiveChat.delegate = self
                LiveChat.customPresentationStyleEnabled = false
                 LiveChat.presentChat()
                 result(nil)
            }
            default:
            result(FlutterMethodNotImplemented)
       }
       }
    
    //iOS Live Chat delegate method to call Message received event
    public func received(message: LiveChatMessage) {
    lifecycleSink?(message.text)
	}
    
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
       lifecycleSink = events
       return nil
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
       lifecycleSink = nil
       return nil 
    }

}
  