//
//  DefaultAdministrationInteractor.swift
//  Beauty
//
//  Created by Vitalii Sosin on 06.11.2021.
//  
//

import Foundation

final class DefaultAdministrationInteractor {

    let presenter: AdministrationPresenter
    let router: AdministrationRouter
    let services: ApplicationServices

    init(_ presenter: AdministrationPresenter, _ router: AdministrationRouter, and services: ApplicationServices) {
        self.presenter = presenter
        self.router = router
        self.services = services
    }
}

extension DefaultAdministrationInteractor: AdministrationInteractor {
    func loadedView() {
    }
}
