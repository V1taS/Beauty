//
//  DefaultOnBoardingInteractor.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

final class DefaultOnBoardingInteractor {

    let presenter: OnBoardingPresenter
    let router: OnBoardingRouter
    let services: ApplicationServices

    init(_ presenter: OnBoardingPresenter, _ router: OnBoardingRouter, and services: ApplicationServices) {
        self.presenter = presenter
        self.router = router
        self.services = services
    }
}

extension DefaultOnBoardingInteractor: OnBoardingInteractor {
    func close() {
        router.showStartScreen()
    }

    func loadedView() {
    }
}
