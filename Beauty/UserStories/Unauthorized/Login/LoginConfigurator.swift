//
//  LoginConfigurator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import UIKit

enum LoginConfigurator {

    static func createModule(with services: ApplicationServices, routeDelegate: LoginModuleDelegate) -> UIViewController {
        let vc = LoginVC()
        let presenter = DefaultLoginPresenter(view: vc)
        let router = DefaultLoginRouter()
        router.delegate = routeDelegate
        let interactor = DefaultLoginInteractor(presenter, router, and: services)
        vc.interactor = interactor
        return vc
    }
}
