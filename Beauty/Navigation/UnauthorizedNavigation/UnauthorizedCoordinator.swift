//
//  UnauthorizedCoordinator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 30.10.2021.
//

import UIKit

final class UnauthorizedCoordinator {
    var authorizedStoryHandler: (() -> Void)?

    private let applicationServices: ApplicationServices
    private let navigationController: UINavigationController
    
    private var loginCoordinator: Coordinator?
    private var onBoardingCoordinator: Coordinator?

//    @OnBoardedState
//    private var onBoarded: Bool

    private var onBoarded = false

    init(applicationServices: ApplicationServices, navigationController: UINavigationController) {
        self.applicationServices = applicationServices
        self.navigationController = navigationController
    }

    private func startAppropriateCoordinator() {
        if onBoarded {
            // onBoarded просмотрен
            return createLoginCoordinator()
        } else {
            // onBoarded не просмотрен
            return createOnBoardingCoordinator()
        }

    }

    private func createLoginCoordinator() {
        let coordinator = HomeScreenCoordinator(services: applicationServices, navigationController: navigationController)
        coordinator.authorizedStoryHandler = authorizedStoryHandler
        loginCoordinator = coordinator
        loginCoordinator?.start()
    }

    private func createOnBoardingCoordinator() {
        let coordinator = OnBoardingCoordinator(services: applicationServices, navigationController: navigationController)
        onBoardingCoordinator = coordinator
        onBoardingCoordinator?.start()
    }
}

extension UnauthorizedCoordinator: Coordinator {
    func start() {
        startAppropriateCoordinator()
    }
}
