package com.deriv.deriv_survicate

import android.app.Activity
import android.os.Handler
import android.os.Looper
import android.util.Log

import androidx.annotation.NonNull

import com.survicate.surveys.Survicate
import com.survicate.surveys.SurvicateAnswer
import com.survicate.surveys.SurvicateEventListener
import com.survicate.surveys.traits.UserTrait

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** DerivSurvicatePlugin */
class DerivSurvicatePlugin : FlutterPlugin, ActivityAware, MethodCallHandler {

    companion object {
        const val TAG = "DERIV_SERVICATE_PLUGIN"
    }

    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "deriv_survicate")

        channel.setMethodCallHandler(this)

        Survicate.init(flutterPluginBinding.getApplicationContext())
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "invokeEvent" -> {
                val eventName: String = call.argument<String>("eventName")!!

                Survicate.invokeEvent(eventName)

                result.success(true)
            }
            "enterScreen" -> {
                val screenName: String = call.argument<String>("screenName")!!

                Survicate.enterScreen(screenName)

                result.success(true)
            }
            "leaveScreen" -> {
                val screenName: String = call.argument<String>("screenName")!!

                Survicate.leaveScreen(screenName)

                result.success(true)
            }
            "setUserTraits" -> {
                val traits = ArrayList<UserTrait>()

                for ((key, value) in call.arguments<HashMap<String, String>>()) {
                    traits.add(UserTrait(key, value))
                }

                Survicate.setUserTraits(traits)

                result.success(true)
            }
            "reset" -> {
                Survicate.reset()

                result.success(true)
            }
            "registerSurveyListeners" -> {
                Survicate.setEventListener(object : SurvicateEventListener() {
                    override fun onSurveyDisplayed(surveyId: String) {
                        Handler(Looper.getMainLooper()).post(Runnable {
                            val arguments: MutableMap<String, String> = HashMap()
                            arguments["surveyId"] = surveyId

                            try {
                                channel.invokeMethod("onSurveyDisplayed", arguments)
                            } catch (exception: Exception) {
                                result.error(TAG, exception.localizedMessage, null)
                            }
                        })
                    }

                    override fun onQuestionAnswered(surveyId: String, questionId: Long, answer: SurvicateAnswer) {
                        Handler(Looper.getMainLooper()).post(Runnable {
                            val arguments = HashMap<String, Any?>()

                            arguments["surveyId"] = surveyId
                            arguments["questionId"] = questionId

                            val answerMap = HashMap<String, Any?>()

                            answerMap["type"] = answer.type
                            answerMap["id"] = answer.id
                            answerMap["ids"] = answer.ids?.toMutableList()
                            answerMap["value"] = answer.value
                            arguments["answer"] = answerMap

                            try {
                                channel.invokeMethod("onQuestionAnswered", arguments)
                            } catch (exception: Exception) {
                                result.error(TAG, exception.localizedMessage, null)
                            }
                        })
                    }

                    override fun onSurveyClosed(surveyId: String) {
                        Handler(Looper.getMainLooper()).post(Runnable {
                            val arguments: MutableMap<String, String> = HashMap()

                            arguments["surveyId"] = surveyId

                            try {
                                channel.invokeMethod("onSurveyClosed", arguments)
                            } catch (exception: Exception) {
                                result.error(TAG, exception.localizedMessage, null)
                            }
                        })
                    }

                    override fun onSurveyCompleted(surveyId: String) {
                        Handler(Looper.getMainLooper()).post(Runnable {
                            val arguments: MutableMap<String, String> = HashMap()

                            arguments["surveyId"] = surveyId

                            try {
                                channel.invokeMethod("onSurveyCompleted", arguments)
                            } catch (exception: Exception) {
                                result.error(TAG, exception.localizedMessage, null)
                            }
                        })
                    }
                })

                result.success(true)
            }
            "unregisterSurveyListeners" -> {
                Survicate.setEventListener(null)

                result.success(true)
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {}

    override fun onDetachedFromActivityForConfigChanges() {}

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {}

    override fun onDetachedFromActivity() {}
}
