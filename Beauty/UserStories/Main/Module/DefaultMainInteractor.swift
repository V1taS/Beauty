//
//  DefaultMainInteractor.swift
//  Beauty
//
//  Created by Vitalii Sosin on 30.10.2021.
//  
//

import Foundation

final class DefaultMainInteractor {

    let presenter: MainPresenter
    let router: MainRouter
    let services: ApplicationServices

    init(_ presenter: MainPresenter, _ router: MainRouter, and services: ApplicationServices) {
        self.presenter = presenter
        self.router = router
        self.services = services
    }
}

extension DefaultMainInteractor: MainInteractor {
    func loadedView() {
    }
}
