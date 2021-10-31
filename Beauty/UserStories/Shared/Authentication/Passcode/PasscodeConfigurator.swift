//
//  PasscodeConfigurator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

enum PasscodeConfigurator {

    static func createModuleCreatePwdState(with services: ApplicationServices, delegate: PasscodeRouterDelegate? = nil) -> UIViewController {
        let vc = createModule(with: services, delegate: delegate)
        vc.state = .createPassword
        return vc
    }

    static func createModuleEnterPwdState(with services: ApplicationServices, delegate: PasscodeRouterDelegate? = nil) -> UIViewController {
        let vc = createModule(with: services, delegate: delegate)
        vc.state = .enterPassword
        return vc
    }

    private static func createModule(with services: ApplicationServices, delegate: PasscodeRouterDelegate? = nil) -> PasscodeVC {
        let vc = PasscodeVC()
        let presenter = DefaultPasscodePresenter(view: vc)
        let router = DefaultPasscodeRouter()
        router.routeDelegate = delegate
        let interactor = DefaultPasscodeInteractor(presenter, and: services)
        vc.interactor = interactor
        vc.router = router
        return vc
    }
}

