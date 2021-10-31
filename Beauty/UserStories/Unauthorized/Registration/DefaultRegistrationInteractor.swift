//
//  DefaultRegistrationInteractor.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

final class DefaultRegistrationInteractor {

    let presenter: RegistrationPresenter
    let router: RegistrationRouter
    let services: ApplicationServices

    init(_ presenter: RegistrationPresenter, _ router: RegistrationRouter, and services: ApplicationServices) {
        self.presenter = presenter
        self.router = router
        self.services = services
    }
}

extension DefaultRegistrationInteractor: RegistrationInteractor {
    func confirmCode() {
        router.showConfirmScreen()
    }

    func login() {
        router.loginToApp()
    }

    func loadedView() {
    }
}
