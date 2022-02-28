package com.deriv.app.deriv_live_chat

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import androidx.annotation.NonNull
import com.livechatinc.inappchat.ChatWindowConfiguration
import com.livechatinc.inappchat.ChatWindowErrorType
import com.livechatinc.inappchat.ChatWindowView
import com.livechatinc.inappchat.models.NewMessageModel
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.util.*

/** DerivLiveChatPlugin */
class DerivLiveChatPlugin: FlutterPlugin, MethodCallHandler , ActivityAware, EventChannel.StreamHandler{
  private lateinit var channel : MethodChannel
  var activity: Activity? = null
  var lifecycleSink: EventSink? = null

  companion object {
    const val CHANNEL = "derivLiveChat"
    const val STREAM = "derivLiveChatStream"
  }

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, CHANNEL)
    channel.setMethodCallHandler(this)

    EventChannel(flutterPluginBinding.binaryMessenger, STREAM)
      .setStreamHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) =
     if (call.method.equals("liveChat_activity")) {
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
        val intent =
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
    }else if(call.method.equals("livechat_view")){
      val licenseNo = call.argument<String>("licenseNo")
      val customParams = call.argument<HashMap<String, String>>("customParams")!!
      val groupId = call.argument<String>("groupId")
      val visitorName = call.argument<String>("visitorName")
      val visitorEmail = call.argument<String>("visitorEmail")
      val chatWindowView = ChatWindowView.createAndAttachChatWindowInstance(activity!!)

      val configuration =  ChatWindowConfiguration.Builder()
        .setLicenceNumber(licenseNo)
        .setGroupId(groupId)
        .setVisitorName(visitorName)
        .setVisitorEmail(visitorEmail)
        .setCustomParams(customParams)
        .build()

      chatWindowView.setUpWindow(configuration)
      chatWindowView.setUpListener(object : ChatWindowView.ChatWindowEventsListener{
        override fun onChatWindowVisibilityChanged(visible: Boolean) {

        }

        override fun onNewMessage(message: NewMessageModel?, windowVisible: Boolean) {
          lifecycleSink?.success(message?.text)
        }

        override fun onStartFilePickerActivity(intent: Intent?, requestCode: Int) {

        }

        override fun onError(
          errorType: ChatWindowErrorType?,
          errorCode: Int,
          errorDescription: String?
        ): Boolean {
          return true
        }

        override fun handleUri(uri: Uri?): Boolean {
          return true
        }
      })

      chatWindowView.initialize()
      chatWindowView.showChatWindow()
       result.success(null)
    }else {
      result.notImplemented()
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
  }

  override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
    lifecycleSink = events
  }

  override fun onCancel(arguments: Any?) {
    lifecycleSink = null
  }

  fun onMessageReceived(message: String, channelUrl: String?, sender: String,
                                 events: EventSink?, messageType: Int) {
    events?.success(message)
  }
}
