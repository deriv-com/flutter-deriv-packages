import Flutter
import UIKit
import AuthenticationServices


public class PasskeyManager: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    public func createPasskey() {
    let challenge: Data = "Base64URLStringChallenge" // Obtain this from the server.
let userID: Data = "bassam@deriv.com" // Obtain this from the server.
let platformProvider = ASAuthorizationPlatformPublicKeyCredentialProvider(relyingPartyIdentifier: "pro-7837426045311437779.frontendapi.corbado.io")
let platformKeyRequest = platformProvider.createCredentialRegistrationRequest(challenge: challenge, name: "Bassam", userID: userID)
let authController = ASAuthorizationController(authorizationRequests: [platformKeyRequest])
authController.delegate = self
authController.presentationContextProvider = self
authController.performRequests()


  }
}
