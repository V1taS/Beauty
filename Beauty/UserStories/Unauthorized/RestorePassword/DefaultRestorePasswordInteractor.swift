//
//  DefaultRestorePasswordInteractor.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

final class DefaultRestorePasswordInteractor {

    let presenter: RestorePasswordPresenter
    let router: RestorePasswordRouter
    let services: ApplicationServices

    init(_ presenter: RestorePasswordPresenter, _ router: RestorePasswordRouter, and services: ApplicationServices) {
        self.presenter = presenter
        self.router = router
        self.services = services
    }
}

extension DefaultRestorePasswordInteractor: RestorePasswordInteractor {
    func loadRequisites() {
        
    }

    func filterForm() {

    }

    func registerUser() {

    }
}
