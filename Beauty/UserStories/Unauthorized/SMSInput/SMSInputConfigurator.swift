//
//  SMSInputConfigurator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import UIKit

enum SMSInputConfigurator {

    static func createModule(with services: ApplicationServices, routeDelegate: SMSInputModuleDelegate) -> UIViewController {
        let vc = SMSInputVC()
        let presenter = DefaultSMSInputPresenter(view: vc)
        let router = DefaultSMSInputRouter()
        router.delegate = routeDelegate
        let interactor = DefaultSMSInputInteractor(presenter, router, and: services)
        vc.interactor = interactor
        return vc
    }
}
