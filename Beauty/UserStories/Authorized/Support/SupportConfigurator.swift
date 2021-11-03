//
//  SupportConfigurator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 04.11.2021.
//  
//

import UIKit

enum SupportConfigurator {

    static func createModule(with services: ApplicationServices) -> UIViewController {
        let vc = SupportVC()
        let presenter = DefaultSupportPresenter(view: vc)
        let router = DefaultSupportRouter()
        let interactor = DefaultSupportInteractor(presenter, router, and: services)
        vc.interactor = interactor
        return vc
    }
}
