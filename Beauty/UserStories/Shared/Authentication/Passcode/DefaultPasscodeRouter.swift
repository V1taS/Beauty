//
//  DefaultPasscodeRouter.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import Foundation

protocol PasscodeRouterDelegate: AnyObject {
    func passcodeCreated()
    func passcodeEnteredCorrectly()
    func exitTapped()
}

final class DefaultPasscodeRouter {
    weak var routeDelegate: PasscodeRouterDelegate?
}

extension DefaultPasscodeRouter: PasscodeRouter {

    func passcodeCreated() {
        routeDelegate?.passcodeCreated()
    }

    func passcodeEnteredCorrectly() {
        routeDelegate?.passcodeEnteredCorrectly()
    }

    func exitTapped() {
        routeDelegate?.exitTapped()
    }
}

