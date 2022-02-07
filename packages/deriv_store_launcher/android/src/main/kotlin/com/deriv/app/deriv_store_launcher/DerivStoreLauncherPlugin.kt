package com.deriv.app.deriv_store_launcher

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.pm.ResolveInfo
import android.net.Uri

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

import android.content.pm.PackageManager

class DerivStoreLauncherPlugin : FlutterPlugin, MethodCallHandler {

  companion object {
    private val TAG = "DERIV_STORE_LUNCHER_PLUGIN"

    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "deriv_store_launcher")

      channel.setMethodCallHandler(DerivStoreLauncherPlugin())
    }
  }

  private lateinit var context: Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    val channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "deriv_store_launcher")

    context = flutterPluginBinding.applicationContext

    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "openStore") {
      if (!call.hasArgument("app_id")) {
        result.error(TAG, "Missing Parameter in method: (${call.method})", null)

        return
      }

      val packageName: String = call.argument("app_id")!!

      if (openStore(packageName)) {
        result.success(true)
      } else {
        result.error(TAG, "Unknown Error in method: (${call.method})", null)
      }
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) { }

  private fun isPackageInstalled(packageName: String, packageManager: PackageManager): Boolean {
    return try {
      packageManager.getApplicationInfo(packageName, 0).enabled
    }
    catch (e: PackageManager.NameNotFoundException) {
      false
    }
  }

  private fun openStore(appId: String): Boolean {
    if (isPackageInstalled("com.android.vending", context.packageManager)) {
      return launchIntent("market://details?id=$appId", "com.android.vending")
    } else if (isPackageInstalled("com.huawei.appmarket", context.packageManager)) {
      return launchIntent("appmarket://details?id=$appId", "com.huawei.appmarket")
    } else {
      return launchWeb("https://play.google.com/store/apps/details?id=$appId")
    }
  }

  private fun launchIntent(url: String, packageName: String): Boolean {
    val intent = Intent(Intent.ACTION_VIEW).apply {
      data = Uri.parse(url)

      addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
      addFlags(Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED)
      addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)

      setPackage(packageName)
    }

    context.startActivity(intent)

    return true
  }

  private fun launchWeb(url: String): Boolean {
    val intent = Intent(Intent.ACTION_VIEW, Uri.parse(url))

    if (intent.resolveActivity(context.packageManager) == null) {
      return false
    } else {
      context.startActivity(intent)
      
      return true
    }
  }
}
