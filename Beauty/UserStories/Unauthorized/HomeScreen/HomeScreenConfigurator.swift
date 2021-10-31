//
//  HomeScreenConfigurator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import UIKit

enum HomeScreenConfigurator {

    static func createModule(with services: ApplicationServices, routeDelegate: HomeScreenModuleDelegate) -> UIViewController {
        let vc = HomeScreenVC()
        let presenter = DefaultHomeScreenPresenter(view: vc)
        let router = DefaultHomeScreenRouter()
        router.delegate = routeDelegate
        let interactor = DefaultHomeScreenInteractor(presenter, router, and: services)
        vc.interactor = interactor
        return vc
    }
}
