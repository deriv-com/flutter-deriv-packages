import Flutter
import UIKit

import Survicate

public class SwiftDerivSurvicatePlugin: NSObject, FlutterPlugin {
    private var survicateDelegate: DerivSurvicateDelegate?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "deriv_survicate", binaryMessenger: registrar.messenger())
        let instance = SwiftDerivSurvicatePlugin()

        instance.survicateDelegate = DerivSurvicateDelegate(channel)
        registrar.addMethodCallDelegate(instance, channel: channel)

        Survicate.shared.initialize()
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let arguments = call.arguments as? [String:String] ?? [:]
        
        switch call.method {
            case "invokeEvent":
                if let eventName = arguments["eventName"] {
                    Survicate.shared.invokeEvent(name: eventName)

                    result(true)
                }

                return
            case "enterScreennt":
                if let screenName = arguments["screenName"] {
                    Survicate.shared.enterScreen(value: screenName)

                    result(true)  
                }

                return
            case "leaveScreen":
                if let screenName = arguments["screenName"] {
                    Survicate.shared.leaveScreen(value: screenName)

                    result(true)
                }

                return
            case "setUserTraits":
                var traits = [UserTrait]()
                
                for (key, value) in arguments {
                    traits.append(UserTrait(withName: key, value: value))
                }

                Survicate.shared.setUserTraits(traits: traits)

                result(true)

                return
            case "reset":
                Survicate.shared.reset()

                result(true)

                return
            case "registerSurveyListeners":
                Survicate.shared.delegate = survicateDelegate

                result(true)

                return
            case "unregisterSurveyListeners":
                Survicate.shared.delegate = nil

                result(true)

                return

            default:
                result(FlutterMethodNotImplemented)
        }
    }
}

class DerivSurvicateDelegate : SurvicateDelegate {
    let channel: FlutterMethodChannel?
    
    init(_ channel: FlutterMethodChannel) {
        self.channel = channel
    }
    
    public func surveyDisplayed(surveyId: String) {
        let arguments = ["surveyId": surveyId]

        DispatchQueue.main.async {
            self.channel?.invokeMethod("onSurveyDisplayed", arguments: arguments)
        }
    }

    public func questionAnswered(surveyId: String, questionId: Int, answer: SurvicateAnswer) {
        let answerMap = ["type": answer.type as Any, "id": answer.id as Any , "ids": answer.ids as Any , "value" : answer.value as Any] as [String : Any]
        let arguments = ["surveyId": surveyId, "questionId": questionId, "answer": answerMap] as [String : Any]

        DispatchQueue.main.async {
            self.channel?.invokeMethod("onQuestionAnswered", arguments: arguments)
        }
    }

    public func surveyCompleted(surveyId: String) {
        let arguments = ["surveyId": surveyId]

        DispatchQueue.main.async {
            self.channel?.invokeMethod("onSurveyCompleted", arguments: arguments)
        }
    }

    public func surveyClosed(surveyId: String) {
        let arguments = ["surveyId": surveyId]
        
        DispatchQueue.main.async {
            self.channel?.invokeMethod("onSurveyClosed", arguments: arguments)
        }
    }
}
