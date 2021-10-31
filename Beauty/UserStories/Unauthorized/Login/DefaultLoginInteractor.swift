//
//  DefaultLoginInteractor.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

final class DefaultLoginInteractor {

    let presenter: LoginPresenter
    let router: LoginRouter
    let services: ApplicationServices

    init(_ presenter: LoginPresenter, _ router: LoginRouter, and services: ApplicationServices) {
        self.presenter = presenter
        self.router = router
        self.services = services
    }
}

extension DefaultLoginInteractor: LoginInteractor {
    func confirmCode() {
        router.showConfirmScreen()
    }

    func registration() {
        router.registrationInApplication()
    }

    func loadedView() {
        
    }
}
