//
//  PasscodeProtocols.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

protocol PasscodeInteractor {
    func loadedView()
    func handleBiometricAuth()
    func invalidateBiometricsAuth()
    func setPinCode()
    func checkPinCode()
}

protocol PasscodePresenter {
    func handle(_ type: BiometricType)
    func handleBiometricAuth(_ result: BiometricAuthResult)

    // FIXME: - реализовать нетворкинг
//    func handle(_ pinResult: RemoteServiceResult<SetPinCodeResult>)
//    func handle(_ pinResult: RemoteServiceResult<LoginWithPinResult>)
}

protocol PasscodeView: AnyObject {
    func update(_ viewModel: PasscodeViewModel)
    func updateAfterBiometricAuth(_ result: BiometricAuthResult)
    func update(_ passwordSuccess: Bool)
}

protocol PasscodeRouter: AnyObject {
    func passcodeEnteredCorrectly()
    func passcodeCreated()
    func exitTapped()
}

