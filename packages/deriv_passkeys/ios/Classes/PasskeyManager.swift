import Flutter
import UIKit
import AuthenticationServices

@available(iOS 15.0, *)
public class PasskeyManager: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {

    enum PluginError: Error {
        case unknownError
        case notFound(String)
        case unknownCredentialType(AnyObject)
        case excludedCredentialExists
    }

public func createPasskey(challengeString: String, userIDString: String) {
    guard let challenge = Data(base64Encoded: challengeString) else {
        // Handle error
        return
    }

    let userID = Data(userIDString.utf8)

    let publicKeyCredentialProvider = ASAuthorizationPlatformPublicKeyCredentialProvider(relyingPartyIdentifier: "pro-7837426045311437779.frontendapi.corbado.io")
    
    do {
        let credentialRegistrationRequest = try publicKeyCredentialProvider.createCredentialRegistrationRequest(challenge: challenge, name: "Bassam", userID: userID)
        let authorizationController = ASAuthorizationController(authorizationRequests: [credentialRegistrationRequest])
        authorizationController.delegate = self
        let contextProvider = try getPresentationContextProvider()
        authorizationController.presentationContextProvider = contextProvider
        authorizationController.performRequests()
        print("Passkey creation Done")
    } catch {
        // Handle error
        print(error)
    }
}

private func getPresentationContextProvider() throws -> ASAuthorizationControllerPresentationContextProviding {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        guard var topController = keyWindow?.rootViewController else {
            throw PluginError.notFound("Root view controller")
        }
        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
        }
        if let nav = topController as? UINavigationController {
            topController = nav.visibleViewController ?? topController
        }
        guard let contextProvider = topController as? ASAuthorizationControllerPresentationContextProviding else {
            throw PluginError.notFound("Presentation context provider")
        }
        return contextProvider
    }

  public func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
    return UIApplication.shared.windows.first { $0.isKeyWindow }!
}
}
