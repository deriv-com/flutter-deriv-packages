import Flutter
import UIKit
import Rudder

public class SwiftDerivRudderstackPlugin: NSObject, FlutterPlugin {
    
    /**
     Determines if the user has enabled or disabled the plugin which means; no events will be sent if [enabled] is false.
     */
    private var enabled = true
    
    let TURNED_OFF = "TURNED_OFF"
    
    // Method names
    let IDENTIFY = "identify"
    let TRACK = "track"
    let SCREEN = "screen"
    let SETUP = "setup"
    let GROUP = "group"
    let ALIAS = "alias"
    let RESET = "reset"
    let SET_CONTEXT = "setContext"
    let ENABLE = "enable"
    let DISABLE = "disable"
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "deriv_rudderstack", binaryMessenger: registrar.messenger())
        let instance = SwiftDerivRudderstackPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        
    }
    
    private func setupRudderStack(_ result: @escaping FlutterResult) {
        var nsDictionary: NSDictionary?
        
        // Gets the values specified by the user at info.plist
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            nsDictionary = NSDictionary(contentsOfFile: path)
            
            // Avoid passing null
            guard let writeKey = nsDictionary?["com.deriv.rudderstack.WRITE_KEY"] as? String else {
                fatalError("WriteKey must not be null")
            }
            
            let trackApplicationLifecycleEvents = nsDictionary?["com.deriv.rudderstack.TRACK_APPLICATION_LIFECYCLE_EVENTS"] as? Bool ?? false
            let recordScreenViews = nsDictionary?["com.deriv.rudderstack.RECORD_SCREEN_VIEWS"] as? Bool ?? false
            
            // LogLevel 0 is NONE and 4 is DEBUG.
            var logLevel = 0
            if let debug = nsDictionary?["com.deriv.rudderstack.DEBUG"] {
                if(debug) as! Bool{
                    logLevel = 4
                }
            }
            
            let builder: RSConfigBuilder = RSConfigBuilder()
                .withTrackLifecycleEvens(trackApplicationLifecycleEvents)
                .withRecordScreenViews(recordScreenViews)
                .withLoglevel(Int32(logLevel))
            
            RSClient.getInstance(writeKey, config: builder.build())
            result(true)
        }
            result(false)

    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch checkMethod(method: call.method) {
        case IDENTIFY:
            self.identify(call, result)
            
        case TRACK:
            self.track(call, result)
            
        case SCREEN:
            self.screen(call, result)
            
        case GROUP:
            self.group(call, result)
            
        case ALIAS:
            self.alias(call, result)

        case SETUP:
            self.setupRudderStack(result)
            
        case RESET:
            self.reset(result)
            
        case SET_CONTEXT:
            self.setContext(call, result)
            
        case ENABLE:
            self.enable(call, result)
            
        case DISABLE:
            self.disable(call, result)
            
        case TURNED_OFF:
            result(false)
            print("Rudderstack analytics was turned off")
            
        default:
            result(false)
        }
    }
    
    private func checkMethod(method: String) -> String {
        if (method == ENABLE || method == DISABLE) {
            return method
        } else {
            return checkEnabled(method: method)
        }
    }
    
    private func checkEnabled(method: String) -> String {
        if (enabled) {
            return method
        } else {
            return TURNED_OFF
        }
    }
    
    // To track the users across the application installation.
    private func identify(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        
        if let myArgs = call.arguments as? [String: Any?],
           let userId : String = myArgs["userId"] as? String,
           let traits: [String: Any]? = myArgs["traits"] as? [String: Any]? {
            
            RSClient.sharedInstance()?.identify(userId, traits: traits!)
            
            result(true)
        } else {
            result(false)
        }
        
    }
    
    // To record the users' activity.
    private func track(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        
        if let myArgs = call.arguments as? [String: Any?],
           let eventName : String = myArgs["eventName"] as? String,
           let properties: [String: Any]? = myArgs["properties"] as? [String: Any]? {
            
            RSClient.sharedInstance()?.track(eventName, properties: properties!)
            
            result(true)
        } else {
            result(false)
        }
        
    }
    
    // You can use the screen call to record whenever the user sees a screen on the mobile device.
    private func screen(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        
        if let myArgs = call.arguments as? [String: Any?],
           let screenName : String = myArgs["screenName"] as? String,
           let properties: [String: Any]? = myArgs["properties"] as? [String: Any]? {
            
            RSClient.sharedInstance()?.screen(screenName, properties: properties!)
            
            result(true)
        } else {
            result(false)
        }
        
    }
    
    // The group call associates a user to a specific organization.
    private func group(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        
        if let myArgs = call.arguments as? [String: Any?],
           let groupId : String = myArgs["groupId"] as? String,
           let traits: [String: Any]? = myArgs["traits"] as? [String: Any]? {
            
            RSClient.sharedInstance()?.group(groupId, traits: traits!)
            
            result(true)
        } else {
            result(false)
        }
        
    }
    
    // The alias call associates the user with a new identification.
    private func alias(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        
        if let myArgs = call.arguments as? [String: Any?],
           let alias : String = myArgs["alias"] as? String {
            
            RSClient.sharedInstance()?.alias(alias)
            
            result(true)
        } else {
            result(false)
        }
        
    }
    
    // Use the reset method to clear the persisted traits for the identify call. This is required for Logout operations.
    private func reset(_ result: @escaping FlutterResult) {
        
        RSClient.sharedInstance()?.reset()
        result(true)
    }
    
    // To send push notification to the destinations that support Push Notification. It is set under context.device.token.
    private func setContext(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        
        if let myArgs = call.arguments as? [String: Any?],
           let pushToken : String = myArgs["pushToken"] as? String {
            
            let rudderstack = Rudderstack()
            rudderstack.pushToken = pushToken
            rudderstack.setToken()
            
            result(true)
        } else {
            result(false)
        }
        
    }
    
    // To enable sending rudder stack events.
    private func enable(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
      
        self.enabled = true
        result(true)
    }
    
    // To disable sending rudder stack events.
    private func disable(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        
        self.enabled = false
        result(true)
    }
}
