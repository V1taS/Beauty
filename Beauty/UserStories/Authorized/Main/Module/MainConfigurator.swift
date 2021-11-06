//
//  MainConfigurator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 30.10.2021.
//  
//

import UIKit

enum MainConfigurator {
    
    static func createModule(with services: ApplicationServices, routeDelegate: MainModuleDelegate) -> UIViewController {
        let vc = MainVC()
        let presenter = DefaultMainPresenter(view: vc)
        let router = DefaultMainRouter()
        router.delegate = routeDelegate
        let interactor = DefaultMainInteractor(presenter, router, and: services)
        vc.interactor = interactor
        return vc
    }
}
