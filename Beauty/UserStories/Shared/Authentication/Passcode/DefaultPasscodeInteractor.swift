//
//  DefaultPasscodeInteractor.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import Foundation

final class DefaultPasscodeInteractor {

    private let presenter: PasscodePresenter
    private let services: ApplicationServices

    init(_ presenter: PasscodePresenter, and services: ApplicationServices) {
        self.presenter = presenter
        self.services = services
    }
}

// FIXME: - настроить сервис
extension DefaultPasscodeInteractor: PasscodeInteractor {

    func invalidateBiometricsAuth() {
        let biometricService = services.biometricService
        biometricService.invalidate()
    }

    func handleBiometricAuth() {
        let biometricService = services.biometricService
        biometricService.authorize { authResult in
            self.presenter.handleBiometricAuth(authResult)
        }
    }

    func setPinCode() {
//        let authService = services.remoteDataSource.authService
//        authService.setPinCode { setPinResult in
//            DispatchQueue.main.async {
//                self.presenter.handle(setPinResult)
//            }
//        }
    }

    func checkPinCode() {
//        let authService = services.remoteDataSource.authService
//        authService.getBaseTokens { tokensResult in
//            authService.loginWithPin { result in
//                DispatchQueue.main.async {
//                    self.presenter.handle(result)
//                }
//            }
//        }
    }

    func loadedView() {
        let biometricService = services.biometricService
        presenter.handle(biometricService.type)
    }
}
