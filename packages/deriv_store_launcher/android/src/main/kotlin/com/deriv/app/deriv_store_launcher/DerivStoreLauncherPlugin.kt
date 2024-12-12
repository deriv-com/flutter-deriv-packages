package com.deriv.app.deriv_store_launcher

import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


class DerivStoreLauncherPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {

    private lateinit var context: Context

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        val channel = MethodChannel(flutterPluginBinding.binaryMessenger, "deriv_store_launcher")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        val packageName = call.argument<String>("package_name") ?: ""
        when (call.method) {
            "openStore" -> handleOpenStore(packageName, result)
            "isAppInstalled" -> handleIsAppInstalled(packageName, result)
            "openApp" -> handleOpenApp(packageName, call.argument("open_store"), result)
            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {}

    private fun handleOpenStore(packageName: String, result: MethodChannel.Result) {
        if (packageName.isNotEmpty()) {
            result.success(openStore(packageName))
        } else {
            result.error("INVALID_ARGUMENT", "Empty or null package name", null)
        }
    }

    private fun handleIsAppInstalled(packageName: String, result: MethodChannel.Result) {
        if (packageName.isNotEmpty()) {
            result.success(isAppInstalled(packageName))
        } else {
            result.error("INVALID_ARGUMENT", "Empty or null package name", null)
        }
    }

    private fun handleOpenApp(
        packageName: String,
        shouldOpenStore: String?,
        result: MethodChannel.Result
    ) {
        if (packageName.isNotEmpty()) {
            result.success(openApp(packageName, shouldOpenStore == "true"))
        } else {
            result.error("INVALID_ARGUMENT", "Empty or null package name", null)
        }
    }

    private fun isAppInstalled(packageName: String): Boolean {
        return try {
            context.packageManager.getPackageInfo(packageName ?: "", PackageManager.GET_ACTIVITIES)
            true
        } catch (e: PackageManager.NameNotFoundException) {
            false
        }
    }

    private fun openStore(packageName: String): Boolean {
        return when {
            isAppInstalled("com.android.vending") -> launchIntent(
                "market://details?id=$packageName",
                "com.android.vending"
            )

            isAppInstalled("com.huawei.appmarket") -> launchIntent(
                "appmarket://details?id=$packageName",
                "com.huawei.appmarket"
            )

            else -> launchWeb("https://play.google.com/store/apps/details?id=$packageName")
        }
    }

    private fun launchIntent(url: String, packageName: String): Boolean {
        val intent = Intent(Intent.ACTION_VIEW).apply {
            data = Uri.parse(url)
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED or Intent.FLAG_ACTIVITY_CLEAR_TOP)
            setPackage(packageName)
        }

        return try {
            context.startActivity(intent)
            true
        } catch (e: Exception) {
            false
        }
    }

    private fun launchWeb(url: String): Boolean {
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse(url))
        return if (intent.resolveActivity(context.packageManager) != null) {
            context.startActivity(intent)
            true
        } else {
            false
        }
    }

    private fun openApp(packageName: String, shouldOpenStore: Boolean): Boolean {
        val intent = context.packageManager.getLaunchIntentForPackage(packageName)

        return if (intent != null) {
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            context.startActivity(intent)
            true
        } else if (shouldOpenStore) {
            openStore(packageName)
        } else {
            false
        }
    }
}