package com.deriv.deriv_rudderstack

import android.content.Context
import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import android.os.Build
import com.rudderstack.android.sdk.core.*
import io.flutter.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** DerivRudderstackPlugin */
class DerivRudderstackPlugin : FlutterPlugin, MethodCallHandler {

    companion object {
        const val TAG = "DerivRudderstackPlugin"
        private const val PACKAGE = "com.deriv.rudderstack"
        const val WRITE_KEY = "$PACKAGE.WRITE_KEY"
        const val DATA_PLANE_URL = "$PACKAGE.DATA_PLANE_URL"
        const val TRACK_APPLICATION_LIFECYCLE_EVENTS = "$PACKAGE.TRACK_APPLICATION_LIFECYCLE_EVENTS"
        const val RECORD_SCREEN_VIEWS = "$PACKAGE.RECORD_SCREEN_VIEWS"
        const val DEBUG = "$PACKAGE.DEBUG"

        const val TURNED_OFF = "TURNED_OFF"

        // Method names
        const val IDENTIFY = "identify"
        const val TRACK = "track"
        const val SCREEN = "screen"
        const val GROUP = "group"
        const val ALIAS = "alias"
        const val RESET = "reset"
        const val SET_CONTEXT = "setContext"
        const val ENABLE = "enable"
        const val DISABLE = "disable"
    }

    private lateinit var channel: MethodChannel
    private lateinit var rudderClient: RudderClient
    private lateinit var context: Context
    private var enabled: Boolean = true

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "deriv_rudderstack")
        channel.setMethodCallHandler(this)

        context = flutterPluginBinding.applicationContext

        configureAndBuildRSClient()

    }

    private fun configureAndBuildRSClient() {

        val applicationInfo: ApplicationInfo = context.packageManager
            .getApplicationInfo(context.packageName, PackageManager.GET_META_DATA)

        val bundle = applicationInfo.metaData

        val writeKey = bundle.getString(WRITE_KEY)
        writeKey?.apply {
            val trackApplicationLifecycleEvents =
                bundle.getBoolean(TRACK_APPLICATION_LIFECYCLE_EVENTS)
            val recordScreenViews = bundle.getBoolean(RECORD_SCREEN_VIEWS)
            val debug = bundle.getBoolean(DEBUG, false)

            val logLevel =
                if (debug) RudderLogger.RudderLogLevel.DEBUG else RudderLogger.RudderLogLevel.NONE

            rudderClient = RudderClient.getInstance(
                context,
                writeKey,
                RudderConfig.Builder()
                    .withDataPlaneUrl(
                        bundle.getString(
                            DATA_PLANE_URL,
                            "https://deriv-dataplane.rudderstack.com"
                        )
                    )
                    .withTrackLifecycleEvents(trackApplicationLifecycleEvents)
                    .withRecordScreenViews(recordScreenViews)
                    .withLogLevel(logLevel)
                    .build()
            )
        } ?: Log.e(TAG, "writeKey must not be null")

    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (checkMethod(call.method)) {
            IDENTIFY -> {
                identify(call, result)
            }

            TRACK -> {
                track(call, result)
            }

            SCREEN -> {
                screen(call, result)
            }

            GROUP -> {
                group(call, result)
            }

            ALIAS -> {
                alias(call, result)
            }

            RESET -> {
                reset(result)
            }

            SET_CONTEXT -> {
                setContext(call, result)
            }

            ENABLE -> {
                enable(result)
            }

            DISABLE -> {
                disable(result)
            }

            TURNED_OFF -> {
                result.success(false)
                Log.i(TAG, "Rudderstack analytics was turned off")
            }

            else -> {
                result.notImplemented()
            }
        }
    }

    private fun checkMethod(method: String): String {
        return if (method == ENABLE || method == DISABLE) method
        else checkEnabled(method)
    }

    private fun checkEnabled(method: String): String = if (enabled) method else TURNED_OFF

    // To track the users across the application installation.
    private fun identify(call: MethodCall, result: Result) {
        try {
            val userId: String? = call.argument("userId")
            val traitsData: HashMap<String, Any>? = call.argument("traits")

            val traits = RudderTraits()

            traitsData?.let {
                for ((key, value) in traitsData) {
                    traits.put(key, value)
                }
            }

            userId?.let {
                rudderClient.identify(userId, traits, null)
            } ?: run {
                result.error(TAG, "userId cannot be null", null)
            }

            result.success(true)

        } catch (e: Exception) {
            result.error(TAG, e.localizedMessage, null)
        }

    }

    // To record the users' activity.
    private fun track(call: MethodCall, result: Result) {
        try {
            val eventName: String? = call.argument("eventName")
            val propertiesData: HashMap<String, Any>? = call.argument("properties")

            val property = RudderProperty()

            propertiesData?.let {
                for ((key, value) in propertiesData) {
                    property.put(key, value)
                }
            }

            eventName?.let {
                rudderClient.track(eventName, property, null)
            } ?: run {
                result.error(TAG, "eventName cannot be null", null)
            }

            result.success(true)

        } catch (e: Exception) {
            result.error(TAG, e.localizedMessage, null)
        }

    }

    // You can use the screen call to record whenever the user sees a screen on the mobile device.
    private fun screen(call: MethodCall, result: Result) {

        try {
            val screenName: String? = call.argument("screenName")
            val propertiesData: HashMap<String, Any>? = call.argument("properties")

            val property = RudderProperty()

            propertiesData?.let {
                for ((key, value) in propertiesData) {
                    property.put(key, value)
                }
            }

            screenName?.let {
                rudderClient.screen(screenName, property, null)
            } ?: run {
                result.error(TAG, "screenName cannot be null", null)
            }

            result.success(true)

        } catch (e: Exception) {
            result.error(TAG, e.localizedMessage, null)
        }


    }

    // The group call associates a user to a specific organization.
    private fun group(call: MethodCall, result: Result) {

        try {
            val groupId: String? = call.argument("groupId")
            val traitsData: HashMap<String, Any>? = call.argument("traits")

            val traits = RudderTraits()

            traitsData?.let {
                for ((key, value) in traitsData) {
                    traits.put(key, value)
                }
            }

            groupId?.let {
                rudderClient.group(groupId, traits, null)
            } ?: run {
                result.error(TAG, "groupId cannot be null", null)
            }

            result.success(true)

        } catch (e: Exception) {
            result.error(TAG, e.localizedMessage, null)
        }


    }

    // The alias call associates the user with a new identification.
    private fun alias(call: MethodCall, result: Result) {

        try {
            val alias: String? = call.argument("alias")

            alias?.let {
                rudderClient.alias(alias)
            } ?: run {
                result.error(TAG, "options cannot be null", null)
            }

            result.success(true)

        } catch (e: Exception) {
            result.error(TAG, e.localizedMessage, null)
        }


    }

    // Use the reset method to clear the persisted traits for the identify call. This is required for Logout operations.
    private fun reset(result: Result) {

        try {
            rudderClient.reset()

            result.success(true)

        } catch (e: Exception) {
            result.error(TAG, e.localizedMessage, null)
        }
    }

    // To send push notification to the destinations that support Push Notification. It is set under context.device.token.
    private fun setContext(call: MethodCall, result: Result) {
        try {
            val pushToken: String? = call.argument("pushToken")
            rudderClient.putDeviceToken(pushToken)

            result.success(true)

        } catch (e: Exception) {
            result.error(TAG, e.localizedMessage, null)
        }
    }


    // To enable sending rudder stack events.
    private fun enable(result: Result) {

        enabled = true
        result.success(true)
    }

    // To disable sending rudder stack events.
    private fun disable(result: Result) {

        enabled = false
        result.success(true)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
