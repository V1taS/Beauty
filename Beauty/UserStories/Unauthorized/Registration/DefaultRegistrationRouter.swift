//
//  DefaultRegistrationRouter.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

protocol RegistrationModuleDelegate: AnyObject {
    func showConfirmScreen()
    func loginToApp()
}

final class DefaultRegistrationRouter {
    weak var delegate: RegistrationModuleDelegate?
}

extension DefaultRegistrationRouter: RegistrationRouter {
    func showConfirmScreen() {
        delegate?.showConfirmScreen()
    }

    func loginToApp() {
        delegate?.loginToApp()
    }
}
