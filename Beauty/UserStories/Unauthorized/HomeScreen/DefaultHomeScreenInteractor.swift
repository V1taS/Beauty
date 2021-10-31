//
//  DefaultHomeScreenInteractor.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

final class DefaultHomeScreenInteractor {

    let presenter: HomeScreenPresenter
    let router: HomeScreenRouter
    let services: ApplicationServices

    init(_ presenter: HomeScreenPresenter, _ router: HomeScreenRouter, and services: ApplicationServices) {
        self.presenter = presenter
        self.router = router
        self.services = services
    }
}

extension DefaultHomeScreenInteractor: HomeScreenInteractor {
    func login(username: String, password: String) {
        router.loginToApp()
    }

    func registration(username: String, password: String) {
        router.registrationInApplication()
    }

    func loadedView() {
    }
}
