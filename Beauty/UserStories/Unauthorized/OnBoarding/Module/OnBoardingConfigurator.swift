//
//  OnBoardingConfigurator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import UIKit

enum OnBoardingConfigurator {

    static func createModule(with services: ApplicationServices, routeDelegate: OnBoardingModuleDelegate) -> UIViewController {
        let vc = OnBoardingVC()
        let presenter = DefaultOnBoardingPresenter(view: vc)
        let router = DefaultOnBoardingRouter()
        router.delegate = routeDelegate
        let interactor = DefaultOnBoardingInteractor(presenter, router, and: services)
        vc.interactor = interactor
        return vc
    }
}
