package com.deriv.passkeys.deriv_passkeys

import androidx.annotation.NonNull

import android.app.Activity

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodChannel.Result

/** DerivPasskeysPlugin */
public class DerivPasskeysPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  private lateinit var activity: Activity

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "deriv_passkeys")
    channel.setMethodCallHandler(this)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity;
  }

  override fun onDetachedFromActivity() {
    // Implement logic when the Activity is detached (if necessary)
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    // Implement logic when the Activity is reattached after configuration changes (if necessary)
    activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    // Implement logic when the Activity is detached for configuration changes (if necessary)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "createPasskey" -> {
        println("createPasskey method called in Android.")
        val requestJsonString: String? = call.argument<String>("requestJson")



        if(requestJsonString != null) {
          println(requestJsonString)
        }else{
          println("requestJsonString is null!!!")
        }

        requestJsonString?.let{
          println("it: ")
          println(it)
          val preferImmediatelyAvailableCredentials = call.argument<Boolean>("preferImmediatelyAvailableCredentials") ?: false
          val passkeyManager = PasskeyManager(activity)
          passkeyManager.createPasskey(it, preferImmediatelyAvailableCredentials)
          result.success("good")
        }

         // You can modify this based on the function result
      }
      "getPlatformVersion" -> {
        result.success("Android ${android.os.Build.VERSION.RELEASE}")
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
