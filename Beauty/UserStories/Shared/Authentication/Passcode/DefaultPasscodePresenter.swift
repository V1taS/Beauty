//
//  DefaultPasscodePresenter.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

final class DefaultPasscodePresenter {

    weak var view: PasscodeView?

    @BoolDefaults(key: DefaultsWrapper.biometricsAuthSuccessful)
    private var biometricsAuthSuccessful: Bool

    init(view: PasscodeView) {
        self.view = view
    }
}

extension DefaultPasscodePresenter: PasscodePresenter {

    func handleBiometricAuth(_ result: BiometricAuthResult) {
        self.view?.updateAfterBiometricAuth(result)
    }

    // FIXME: - добавить иконку
    func handle(_ type: BiometricType) {
        if biometricsAuthSuccessful {
            let viewModel: PasscodeViewModel
            switch type {
            case .faceID:
                viewModel = .init(image: UIImage.add.tinted(with: UIColor.black) ?? UIImage(), buttonVisible: true)
            case .touchID:
                viewModel = .init(image: UIImage.add.tinted(with: UIColor.black) ?? UIImage(), buttonVisible: true)
            case .none:
                viewModel = .init(image: nil, buttonVisible: false)
            }
            view?.update(viewModel)
        } else {
            let viewModel = PasscodeViewModel.init(image: nil, buttonVisible: false)
            view?.update(viewModel)
        }
    }

//    func handle(_ result: RemoteServiceResult<SetPinCodeResult>) {
//        if case .success(let object) = result, object.result == true {
//            view?.update(true)
//        } else {
//            view?.update(false)
//        }
//    }
//
//    func handle(_ result: RemoteServiceResult<LoginWithPinResult>) {
//        if case .success(let object) = result, object.result == true {
//            view?.update(true)
//        } else {
//            view?.update(false)
//        }
//    }
}

