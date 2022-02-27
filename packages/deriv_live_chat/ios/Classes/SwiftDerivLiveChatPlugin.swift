import Flutter
import UIKit
import LiveChat
import UserNotifications


public class SwiftDerivLiveChatPlugin: NSObject, FlutterPlugin,LiveChatDelegate {


  public static func register(with registrar: FlutterPluginRegistrar) {
      let channel = FlutterMethodChannel(name: "deriv_live_chat", binaryMessenger: registrar.messenger())
    let instance = SwiftDerivLiveChatPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  
  }
 

  
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
   
    
     switch call.method {
       case "messageReceived":
            result("messageReceived")
       
        case "beginChat":

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
                  LiveChat.setVariable(withKey:key, value:value)
                      }
                 LiveChat.delegate = self
                LiveChat.presentChat()
                result(nil)
            }
        default:
            result(FlutterMethodNotImplemented)
    }
  }
  //ios live chat delegate method to call Message received event
  public func received(message: LiveChatMessage) {
		NSLog("Received message: /message")

	}
}
  