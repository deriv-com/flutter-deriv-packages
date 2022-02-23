package com.deriv.app.deriv_live_chat

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.os.Bundle
import androidx.annotation.NonNull
import com.livechatinc.inappchat.ChatWindowConfiguration
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.util.*

/** DerivLiveChatPlugin */
class DerivLiveChatPlugin: FlutterPlugin, MethodCallHandler , ActivityAware {
  private lateinit var channel : MethodChannel
  var activity: Activity? = null
  private val context: Context? = null
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "deriv_live_chat")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if (call.method.equals("liveChat_activity")) {
      val licenseNo = call.argument<String>("licenseNo")
      val customParams = call.argument<HashMap<String, String>>("customParams")!!
      val groupId = call.argument<String>("groupId")
      val visitorName = call.argument<String>("visitorName")
      val visitorEmail = call.argument<String>("visitorEmail")

      if (licenseNo?.trim { it <= ' ' }.equals("", ignoreCase = true)) {
        result.error("LICENSE NUMBER EMPTY", null, null)
      } else if (visitorName!!.trim { it <= ' ' }.equals("", ignoreCase = true)) {
        result.error("VISITOR NAME EMPTY", null, null)
      } else if (visitorEmail!!.trim { it <= ' ' }.equals("", ignoreCase = true)) {
        result.error("VISITOR EMAIL EMPTY", null, null)
      }else{
        val intent: Intent =
          Intent(activity, com.livechatinc.inappchat.ChatWindowActivity::class.java)
        val config: Bundle = ChatWindowConfiguration.Builder()
          .setLicenceNumber(licenseNo)
          .setGroupId(groupId)
          .setVisitorName(visitorName)
          .setVisitorEmail(visitorEmail)
          .setCustomParams(customParams)
          .build()
          .asBundle()

        intent.putExtras(config)
        activity?.startActivity(intent)

        result.success(null)
      }

    }else if(call.method.equals("liveChat_fragment")){
      val licenseNo = call.argument<String>("licenseNo")
      val customParams = call.argument<HashMap<String, String>>("customParams")!!
      val groupId = call.argument<String>("groupId")
      val visitorName = call.argument<String>("visitorName")
      val visitorEmail = call.argument<String>("visitorEmail")

      activity?.getFragmentManager()
        .beginTransaction()
        .replace(R.id.frame_layout, ChatWindowFragment.newInstance("your_license_number", "your_group_id"), "chat_fragment")
        .addToBackStack("chat_fragment")
        .commit();


    }else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    TODO("Not yet implemented")
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    TODO("Not yet implemented")
  }

  override fun onDetachedFromActivity() {
    TODO("Not yet implemented")
  }
}
