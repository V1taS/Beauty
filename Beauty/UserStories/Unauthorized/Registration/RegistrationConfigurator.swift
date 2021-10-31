//
//  RegistrationConfigurator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import UIKit

enum RegistrationConfigurator {

    static func createModule(with services: ApplicationServices, routeDelegate: RegistrationModuleDelegate) -> UIViewController {
        let vc = RegistrationVC()
        let presenter = DefaultRegistrationPresenter(view: vc)
        let router = DefaultRegistrationRouter()
        router.delegate = routeDelegate
        let interactor = DefaultRegistrationInteractor(presenter, router, and: services)
        vc.interactor = interactor
        return vc
    }
}
