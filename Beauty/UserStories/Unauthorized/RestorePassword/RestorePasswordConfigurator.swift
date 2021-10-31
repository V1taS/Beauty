//
//  RestorePasswordConfigurator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import UIKit

enum RestorePasswordConfigurator {

    static func createModule(with services: ApplicationServices, routeDelegate: RestorePasswordRouter) -> UIViewController {
        let vc = RestorePasswordVC()
        let presenter = DefaultRestorePasswordPresenter(view: vc)
        let router = routeDelegate
        let interactor = DefaultRestorePasswordInteractor(presenter, router, and: services)
        vc.interactor = interactor
        return vc
    }
}
