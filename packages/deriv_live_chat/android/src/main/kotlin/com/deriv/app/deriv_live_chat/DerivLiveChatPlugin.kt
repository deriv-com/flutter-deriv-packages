package com.deriv.app.deriv_live_chat
import android.app.Activity
import android.content.Intent
import android.net.Uri
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

/** DerivLiveChatPlugin */
class DerivLiveChatPlugin: FlutterPlugin, MethodCallHandler , ActivityAware, EventChannel.StreamHandler{
  private lateinit var channel: MethodChannel
  private var activity: Activity? = null

  var lifecycleSink: EventSink? = null
  private var chatWindowView : ChatWindowView ?= null

  companion object {
    const val _liveChatMethodChannel = "deriv_live_chat"
    const val _liveChatEventChannel = "deriv_live_chat_event_listener"
  }

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, _liveChatMethodChannel)
    channel.setMethodCallHandler(this)

    EventChannel(flutterPluginBinding.binaryMessenger, _liveChatEventChannel)
      .setStreamHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) =
    if (call.method.equals("derivLiveChatView")) {
      val licenseNo = call.argument<String>("licenseNo")
      val customParams = call.argument<HashMap<String, String>>("customParams")!!
      val groupId = call.argument<String>("groupId")
      val visitorName = call.argument<String>("visitorName")
      val visitorEmail = call.argument<String>("visitorEmail")
      if(chatWindowView == null ){
        chatWindowView = ChatWindowView.createAndAttachChatWindowInstance(activity!!)
        val configuration = ChatWindowConfiguration.Builder()
          .setLicenceNumber(licenseNo)
          .setGroupId(groupId)
          .setVisitorName(visitorName)
          .setVisitorEmail(visitorEmail)
          .setCustomParams(customParams)
          .build()

        chatWindowView?.setUpWindow(configuration)
        chatWindowView?.setUpListener(chatListener)
        chatWindowView?.initialize()
      }
      chatWindowView?.showChatWindow()
      result.success(null)
    } else {
      result.notImplemented()
    }

  private val chatListener = object : ChatWindowView.ChatWindowEventsListener {
    override fun onChatWindowVisibilityChanged(visible: Boolean) {
      if(visible){
        lifecycleSink?.success("chatOpen")
      }else{
        lifecycleSink?.success("chatClose")
      }
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
  }
  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    lifecycleSink = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
  }

  override fun onDetachedFromActivity() {
  }

  override fun onListen(arguments: Any?, events: EventSink?) {
    lifecycleSink = events
  }

  override fun onCancel(arguments: Any?) {
    lifecycleSink = null
  }
}

