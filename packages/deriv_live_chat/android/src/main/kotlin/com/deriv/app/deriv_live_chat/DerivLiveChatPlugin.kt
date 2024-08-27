package com.deriv.app.deriv_live_chat

import android.app.Activity
import android.content.ContentValues.TAG
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.WindowManager
import android.webkit.CookieManager
import android.webkit.CookieSyncManager
import android.webkit.WebStorage
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
import io.flutter.plugin.common.PluginRegistry

/** DerivLiveChatPlugin */
class DerivLiveChatPlugin : FlutterPlugin, MethodCallHandler,
    ActivityAware,
    EventChannel.StreamHandler,
    PluginRegistry.ActivityResultListener {

    private lateinit var channel: MethodChannel
    private var activity: Activity? = null
    var lifecycleSink: EventSink? = null
    private var chatWindowView: ChatWindowView? = null

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

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) =
        if (call.method.equals("open_live_chat_view")) {
            val licenseId = call.argument<String>("licenseId")
            val visitorName = call.argument<String>("visitorName")
            val visitorEmail = call.argument<String>("visitorEmail")
            val groupId = call.argument<String>("groupId")
            val customParams = call.argument<HashMap<String, String>>("customParams")!!

            if (chatWindowView == null) {
                chatWindowView = createCustomAndAttachChatWindowInstance(activity!!)
            }

            val configuration = ChatWindowConfiguration.Builder()
                .setLicenceNumber(licenseId)
                .setVisitorName(visitorName)
                .setVisitorEmail(visitorEmail)
                .setGroupId(groupId)
                .setCustomParams(customParams)
                .build()

            chatWindowView?.setUpWindow(configuration)
            chatWindowView?.setUpListener(chatListener)
            if (chatWindowView?.isInitialized() == false)
                chatWindowView?.initialize()


            chatWindowView?.showChatWindow()

            result.success(null)
        } else if (call.method.equals("close_live_chat_view")) {
            chatWindowView?.setUpListener(null);

            chatWindowView?.onBackPressed()

            result.success(null)
        } else if (call.method.equals("clear_live_chat_view")) {
            ChatWindowView.clearSession(chatWindowView?.context)
            chatWindowView?.reload()
            chatWindowView = null

            result.success(null)
        } else if (call.method.equals("reload_live_chat_view")) {
            chatWindowView?.reload()
            chatWindowView = null
            result.success(null)
        } else {
            result.notImplemented()
        }

    private val chatListener = object : ChatWindowView.ChatWindowEventsListener {
        override fun onChatWindowVisibilityChanged(visible: Boolean) {
            if (visible) {
                lifecycleSink?.success("chatOpen")
            } else {
                lifecycleSink?.success("chatClose")
            }
        }

        override fun onNewMessage(message: NewMessageModel?, windowVisible: Boolean) {
            lifecycleSink?.success(message?.text)
        }

        override fun onStartFilePickerActivity(intent: Intent?, requestCode: Int) {
            activity?.startActivityForResult(intent, requestCode)
        }

        override fun onError(
            errorType: ChatWindowErrorType?,
            errorCode: Int,
            errorDescription: String?
        ): Boolean {
            return true
        }

        override fun handleUri(uri: Uri?): Boolean {
            return false
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        binding.addActivityResultListener(this)
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

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (chatWindowView != null) chatWindowView?.onActivityResult(requestCode, resultCode, data)
        return true
    }

    private fun clearSession(context: Context?) {
        WebStorage.getInstance().deleteAllData()

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP_MR1) {
            CookieManager.getInstance().removeAllCookies(null)
            CookieManager.getInstance().flush()
        } else {
            val cookieSyncManager = CookieSyncManager.createInstance(context)

            cookieSyncManager.startSync()

            val cookieManager = CookieManager.getInstance()

            cookieManager.removeAllCookie()
            cookieManager.removeSessionCookie()
            cookieSyncManager.stopSync()
            cookieSyncManager.sync()
        }
    }

    private fun createCustomAndAttachChatWindowInstance(activity: Activity): ChatWindowView {
        val contentView =
            activity.window.decorView.findViewById<View>(android.R.id.content) as ViewGroup
        var statusBarHeight = 100;
        val statusBarID = activity.resources.getIdentifier("status_bar_height", "dimen", "android")
        statusBarHeight = activity.resources.getDimensionPixelSize(statusBarID)

        val chatWindowView = LayoutInflater.from(activity)
            .inflate(
                com.livechatinc.inappchat.R.layout.view_chat_window,
                contentView,
                false
            ) as ChatWindowView
        chatWindowView.setPadding(0, statusBarHeight, 0, 0)

        contentView.addView(
            chatWindowView,
            WindowManager.LayoutParams.MATCH_PARENT,
            WindowManager.LayoutParams.MATCH_PARENT,
        )

        return chatWindowView
    }
}
