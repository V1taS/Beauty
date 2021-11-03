//
//  DefaultSupportInteractor.swift
//  Beauty
//
//  Created by Vitalii Sosin on 04.11.2021.
//  
//

import Foundation

final class DefaultSupportInteractor {

    let presenter: SupportPresenter
    let router: SupportRouter
    let services: ApplicationServices

    init(_ presenter: SupportPresenter, _ router: SupportRouter, and services: ApplicationServices) {
        self.presenter = presenter
        self.router = router
        self.services = services
    }
}

extension DefaultSupportInteractor: SupportInteractor {
    func loadedView() {
    }
}
