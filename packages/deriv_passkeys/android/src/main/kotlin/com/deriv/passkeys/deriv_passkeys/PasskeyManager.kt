package com.deriv.passkeys.deriv_passkeys

import android.app.Activity
import android.content.ContentValues.TAG
import android.util.Log
import android.content.Context
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.credentials.CreateCredentialResponse;
import androidx.credentials.CreatePublicKeyCredentialRequest;
import androidx.credentials.Credential;
import androidx.credentials.CredentialManager;
import androidx.credentials.GetPasswordOption;
import androidx.credentials.CredentialManagerCallback;
import androidx.credentials.CustomCredential
import androidx.credentials.GetCredentialRequest;
import androidx.credentials.GetCredentialResponse;
import androidx.credentials.GetPublicKeyCredentialOption;
import androidx.credentials.PasswordCredential
import androidx.credentials.PublicKeyCredential;
import androidx.credentials.exceptions.CreateCredentialCancellationException
import androidx.credentials.exceptions.CreateCredentialException;
import androidx.credentials.exceptions.CreateCredentialInterruptedException
import androidx.credentials.exceptions.publickeycredential.CreatePublicKeyCredentialDomException
import androidx.credentials.exceptions.CreateCredentialProviderConfigurationException
import androidx.credentials.exceptions.CreateCredentialUnknownException
import androidx.credentials.exceptions.CreateCredentialCustomException
import androidx.credentials.exceptions.GetCredentialException

import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.MainScope
import kotlinx.coroutines.launch

interface Callback {
    fun onSuccess(result: String)
    fun onFailure(error: String)
}

class PasskeyManager (private val activity: Activity) {

    // Initialize the Credential Manager
    private val credentialManager = CredentialManager.create(activity)
    private val coroutineScope = MainScope()

    fun createPasskey(requestJson: String, preferImmediatelyAvailableCredentials: Boolean, callback: Callback){
        println("PasskeyManager@createPasskey called.")
        val createPublicKeyCredentialRequest = CreatePublicKeyCredentialRequest(
                // Contains the request in JSON format. Uses the standard WebAuthn
                // web JSON spec.
                requestJson = requestJson,
                // Defines whether you prefer to use only immediately available
                // credentials, not hybrid credentials, to fulfill this request.
                // This value is false by default.
                preferImmediatelyAvailableCredentials = preferImmediatelyAvailableCredentials,
        )

        println("createPublicKeyCredentialRequest passed.")

        // Execute CreateCredentialRequest asynchronously to register credentials
        // for a user account. Handle success and failure cases with the result and
        // exceptions, respectively.
        coroutineScope.launch {
            try {
                val credentialResult = credentialManager.createCredential(
                        // Use an activity-based context to avoid undefined system
                        // UI launching behavior
                        context = activity,
                        request = createPublicKeyCredentialRequest,
                )
                val responseJson = credentialResult.data.getString("androidx.credentials.BUNDLE_KEY_REGISTRATION_RESPONSE_JSON");
                println("handlePasskeyRegistrationResult(${responseJson})")

                responseJson?.let { callback.onSuccess(it) } ?: callback.onFailure("No response JSON found")

            } catch (e : CreateCredentialException){
                handleFailure(e)
                throw e
            }
        }
    }

    fun handleFailure(e: CreateCredentialException) {
        when (e) {
            is CreatePublicKeyCredentialDomException -> {
                // Handle the passkey DOM errors thrown according to the
                // WebAuthn spec.
                println("CreatePublicKeyCredentialDomException(${e.domError})")
                println("CreatePublicKeyCredentialDomException(${e.message})")
            }
            is CreateCredentialCancellationException -> {
                // The user intentionally canceled the operation and chose not
                // to register the credential.
                println("CreateCredentialCancellationException(${e.errorMessage})")
            }
            is CreateCredentialInterruptedException -> {
                // Retry-able error. Consider retrying the call.
                println("CreateCredentialInterruptedException(${e.errorMessage})")
            }
            is CreateCredentialProviderConfigurationException -> {
                // Your app is missing the provider configuration dependency.
                // Most likely, you're missing the
                // "credentials-play-services-auth" module.
                println("CreateCredentialProviderConfigurationException(${e.errorMessage})")
            }
            is CreateCredentialUnknownException -> {
                println("CreateCredentialUnknownException(${e.errorMessage})")
            }
            is CreateCredentialCustomException -> {
                // You have encountered an error from a 3rd-party SDK. If you
                // make the API call with a request object that's a subclass of
                // CreateCustomCredentialRequest using a 3rd-party SDK, then you
                // should check for any custom exception type constants within
                // that SDK to match with e.type. Otherwise, drop or log the
                // exception.
                println("CreateCredentialCustomException(${e.errorMessage})")
            }
            else -> Log.w(TAG, "Unexpected exception type ${e::class.java.name}")
        }
    }

    fun signInWithPasskey(requestJson: String, callback: Callback) {
        val getPasswordOption = GetPasswordOption()

        val getPublicKeyCredentialOption = GetPublicKeyCredentialOption(
            requestJson = requestJson
        )

        val getCredRequest = GetCredentialRequest(
            listOf(getPasswordOption, getPublicKeyCredentialOption)
        )

        coroutineScope.launch {
            try {
                val credentialResult = credentialManager.getCredential(
                    // Use an activity-based context to avoid undefined system UI
                    // launching behavior.
                    context = activity,
                    request = getCredRequest
                )
                val responseJson = (credentialResult.credential as PublicKeyCredential).authenticationResponseJson;
                println("handlePasskeyRegistrationResult(${responseJson})")

                responseJson?.let { callback.onSuccess(it) } ?: callback.onFailure("No response JSON found")
            } catch (e : GetCredentialException) {
                println(e.message)
                throw e
            }
        }
    }

    fun handleSignIn(result: GetCredentialResponse) {
        // Handle the successfully returned credential.
        val credential = result.credential

        when (credential) {
            is PublicKeyCredential -> {
                val responseJson = credential.authenticationResponseJson
                // Share responseJson i.e. a GetCredentialResponse on your server to
                // validate and  authenticate
            }else -> {
            // Catch any unrecognized credential type here.
            Log.e(TAG, "Unexpected type of credential")
        }
        }
    }

    fun managePasskeys() {
        // Implement logic to manage existing passkeys
    }
}
