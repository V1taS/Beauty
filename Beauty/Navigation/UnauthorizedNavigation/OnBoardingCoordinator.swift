//
//  OnBoardingCoordinator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

public final class OnBoardingCoordinator {

    // MARK: - Private variables
    private let navigationController: UINavigationController
    private let services: ApplicationServices

    private var loginCoordinator: Coordinator?

    var authorizedStoryHandler: (() -> Void)?

    @OnBoardedState
    private var onBoarded: Bool

    // MARK: - Initialization
    init(services: ApplicationServices, navigationController: UINavigationController) {
        self.services = services
        self.navigationController = navigationController
    }

    private func startloginCoordinator(with navigationController: UINavigationController) {
        let loginCoordinator = HomeScreenCoordinator(services: services, navigationController: navigationController)
        loginCoordinator.authorizedStoryHandler = authorizedStoryHandler
        self.loginCoordinator = loginCoordinator
        self.loginCoordinator?.start()
    }
}

extension OnBoardingCoordinator: Coordinator {
    public func start() {
        let vc = OnBoardingConfigurator.createModule(with: services, routeDelegate: self)
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.setViewControllers([vc], animated: false)
    }
}

extension OnBoardingCoordinator: OnBoardingModuleDelegate {
    func showStartScreen() {
        onBoarded = true
        startloginCoordinator(with: navigationController)
    }
}
