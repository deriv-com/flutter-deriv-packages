package com.deriv.passkeys.deriv_passkeys

import android.app.Activity
import android.content.Context
import androidx.credentials.CreatePublicKeyCredentialRequest
import androidx.credentials.CreatePublicKeyCredentialResponse
import androidx.credentials.CredentialManager
import androidx.credentials.GetCredentialRequest
import androidx.credentials.GetPublicKeyCredentialOption
import androidx.credentials.PublicKeyCredential
import androidx.credentials.exceptions.publickeycredential.CreatePublicKeyCredentialDomException
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import kotlinx.coroutines.launch
import org.json.JSONObject

/// DerivPasskeysPlugin is a Flutter plugin that provides a way to create and get credentials using the WebAuthn API.
class DerivPasskeysPlugin: FlutterPlugin, MethodCallHandler, ViewModel() {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel: MethodChannel
  private lateinit var context: Context


  private fun createCredential(options: String, callback: (credential: String?, e: Exception?) -> Unit) {
    JSONObject(options)
    val createPublicKeyCredentialRequest = CreatePublicKeyCredentialRequest(
      requestJson = options,
      preferImmediatelyAvailableCredentials = false
    )
    viewModelScope.launch {
      try {
        val credentialManager = CredentialManager.create(context)
        val result = credentialManager.createCredential(
          context = context,
          request = createPublicKeyCredentialRequest,
        )
        val credential = result as CreatePublicKeyCredentialResponse
        callback(credential.registrationResponseJson, null)
      } catch (e: Exception) {
        callback(null, e)
      }
    }
  }

  private fun getCredential(options: String, callback: (credential: String?, e: Exception?) -> Unit) {
    JSONObject(options)
    val getPublicKeyCredentialOption = GetPublicKeyCredentialOption(
      requestJson = options
    )
    viewModelScope.launch {
      try {
        val credentialManager = CredentialManager.create(context)
        val result = credentialManager.getCredential(
          context = context,
          request = GetCredentialRequest(listOf(getPublicKeyCredentialOption)),
        )
        val credential = result.credential as PublicKeyCredential
        callback(credential.authenticationResponseJson, null)
      } catch (e: Exception) {
        callback(null, e)
      }
    }
  }

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "deriv_passkeys")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {
      "isPlatformSupported" -> {
        val isSupported = android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.P
        result.success(isSupported)
    }
      "createCredential" -> {
        val options = call.argument("options") as String?
        options?.let {
          try {
            createCredential(options) { credential, e ->
              if (credential != null) {
                result.success(credential)
              }
              else if (e != null) {
                var exceptionType = e.javaClass.kotlin.simpleName
                if (e is CreatePublicKeyCredentialDomException) {
                    exceptionType = "$exceptionType(${e.domError.javaClass.kotlin.simpleName ?: "DomError"})"
                }
                result.error(exceptionType ?: "Exception", e.message ?: "Exception occurred", null)
              }
              else {
                result.error("Error", "Unknown error", null)
              }
            }
          } catch (e: Exception) {
            result.error(e.javaClass.kotlin.simpleName ?: "Exception", e.message ?: "Exception occurred", null)
          }
          } ?: run {
            result.error("InvalidParameterException", "Options not found", null)
          }
        
      }
      "getCredential" -> {
        val options = call.argument("options") as String?
        options?.let {
          try {
            getCredential(options) { credential, e ->
              if (credential != null) {
                result.success(credential)
              }
              else if (e != null) {
                result.error(e.javaClass.kotlin.simpleName ?: "Exception", e.message ?: "Exception occurred", null)
              }
              else {
                result.error("Error", "Unknown error", null)
              }
            }
          } catch (e: Exception) {
            result.error(e.javaClass.kotlin.simpleName ?: "Exception", e.message ?: "Exception occurred", null)
          }
          } ?: run {
            result.error("InvalidParameterException", "Options not found", null)
          }
      }
      else -> result.notImplemented()
    }
  }
}
