//
//  AdministrationConfigurator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 06.11.2021.
//  
//

import UIKit

enum AdministrationConfigurator {

    static func createModule(with services: ApplicationServices, routeDelegate: AdministrationModuleDelegate) -> UIViewController {
        let vc = AdministrationVC()
        let presenter = DefaultAdministrationPresenter(view: vc)
        let router = DefaultAdministrationRouter()
        router.delegate = routeDelegate
        let interactor = DefaultAdministrationInteractor(presenter, router, and: services)
        vc.interactor = interactor
        return vc
    }
}
