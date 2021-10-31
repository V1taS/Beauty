//
//  DefaultSMSInputInteractor.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

final class DefaultSMSInputInteractor {

    let presenter: SMSInputPresenter
    let router: SMSInputRouter
    let services: ApplicationServices

    init(_ presenter: SMSInputPresenter, _ router: SMSInputRouter, and services: ApplicationServices) {
        self.presenter = presenter
        self.router = router
        self.services = services
    }
}

extension DefaultSMSInputInteractor: SMSInputInteractor {
    func loadedView() {
        router.showMainScreen()
    }
}
