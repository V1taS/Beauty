//
//  DefaultBiometricAuthService.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import Foundation
import LocalAuthentication

final class DefaultBiometricAuthService {
    @BoolDefaults(key: DefaultsWrapper.biometricsAuthSuccessful)
    private var biometricsAuthSuccessful: Bool

    @KeychainStorage(key: KeychainConstants.biometricsDomainState)
    private var biometricsDomainState: String

    @BoolDefaults(key: DefaultsWrapper.showBiometricsAuthentication)
    private var showBiometricsConfiguration: Bool

    private func evaluateBiometricType() -> BiometricType {
        let evaluationContext = LAContext()
        var error: NSError?

        guard evaluationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            return .none
        }

        if #available(iOS 11.0, *) {
            switch evaluationContext.biometryType {
            case .none:
                return .none
            case .touchID:
                return .touchID
            case .faceID:
                return .faceID
            @unknown default:
                return .none
            }
        } else {
            return evaluationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) ? .touchID : .none
        }
    }
}

extension DefaultBiometricAuthService: BiometricAuthService {

    var type: BiometricType {
        evaluateBiometricType()
    }

    func authorize(with completion: ((BiometricAuthResult) -> Void)?) {
        if type != .none {
            let context = LAContext()
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: Constants.biometricsUsageReason) { success, failure in

                let newBiometricsDomainState = context.evaluatedPolicyDomainState?.base64EncodedString()

                DispatchQueue.main.async {

                    if let error = failure {
                        completion?(.failure(error))
                    } else {

                        if success {
                            if self.biometricsAuthSuccessful {

                                if let newBiometricsState = newBiometricsDomainState, self.biometricsDomainState == newBiometricsState {
                                    // Success
                                    completion?(.success)
                                } else {
                                    // Failed
                                    self.biometricsAuthSuccessful = false
                                    self.showBiometricsConfiguration = true
                                    completion?(.failure(BiometricAuthErrors.biometricsStateChanged))
                                }
                            } else {

                                self.biometricsAuthSuccessful = true
                                if let newBiometricsState = newBiometricsDomainState {
                                    self.biometricsDomainState = newBiometricsState
                                }
                                completion?(.success)
                            }
                        } else {
                            completion?(.failure(BiometricAuthErrors.biometricsNotAvailable))
                        }
                    }

                }

            }
        } else {
            completion?(.failure(BiometricAuthErrors.biometricsNotAvailable))
        }
    }

    func invalidate() {
        let context = LAContext()
        context.invalidate()
    }
}

private enum Constants {
    static let biometricsUsageReason = "Вход в приложение"
}
