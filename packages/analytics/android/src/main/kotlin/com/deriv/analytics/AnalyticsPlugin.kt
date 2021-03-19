package com.deriv.analytics

import android.content.Context
import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

/** AnalyticsPlugin */
class AnalyticsPlugin: FlutterPlugin, MethodCallHandler {

  companion object {
    private const val PACKAGE = "com.deriv.analytics"
    const val WRITE_KEY = "$PACKAGE.WRITE_KEY"
  }

  private lateinit var channel : MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, PACKAGE)
    channel.setMethodCallHandler(this)

    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getWriteKey") {

      // Gets the values specified by the user at AndroidManifest.xml
      val applicationInfo: ApplicationInfo = context.packageManager
              .getApplicationInfo(context.packageName, PackageManager.GET_META_DATA)

      val bundle = applicationInfo.metaData

      val writeKey = bundle.getString(WRITE_KEY)

      writeKey?.apply {
        result.success(this)
      }

    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
