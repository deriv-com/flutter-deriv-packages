package com.sky.flutter_install_referer;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.text.TextUtils;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.io.File;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * AndroidMetadataPlugin
 */
public class FlutterInstallRefererPlugin implements MethodCallHandler {
  private final Registrar mRegistrar;

  /**
   * Plugin registration.
   */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(),
            "flutter_install_referer");
    channel.setMethodCallHandler(new FlutterInstallRefererPlugin(registrar));
  }

  private FlutterInstallRefererPlugin(Registrar registrar) {
    this.mRegistrar = registrar;
  }

  public static String getRaw(final File apkFile) {
    return PayloadReader.getString(apkFile, ApkUtil.APK_CHANNEL_BLOCK_ID);
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    Context context = mRegistrar.context();
    if (call.method.equals("installReferer")) {
      Map<String, String> map = new HashMap<>();
      String apkPath = null;
      try {
        final ApplicationInfo applicationInfo = context.getApplicationInfo();
        if (applicationInfo != null) {
          apkPath = applicationInfo.sourceDir;
        }
      } catch (Throwable e) {
      }
      if (!TextUtils.isEmpty(apkPath)) {
        try {
          final String rawString = getRaw(new File(apkPath));
          if (rawString != null) {
            final JSONObject jsonObject = new JSONObject(rawString);
            final Iterator keys = jsonObject.keys();
            while (keys.hasNext()) {
              final String key = keys.next().toString();
              map.put(key, jsonObject.getString(key));
            }
          }
        } catch (JSONException e) {
          e.printStackTrace();
        }
      }
      result.success(map);
    } else {
      result.notImplemented();
    }

  }
}
