//
//  DefaultLoginRouter.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

protocol LoginModuleDelegate: AnyObject {
    func showConfirmScreen()
    func registrationInApplication()
}

final class DefaultLoginRouter {
    weak var delegate: LoginModuleDelegate?
}

extension DefaultLoginRouter: LoginRouter {
    func showConfirmScreen() {
        delegate?.showConfirmScreen()
    }

    func registrationInApplication() {
        delegate?.registrationInApplication()
    }
}
