//
//  HomeScreenCoordinator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

final class HomeScreenCoordinator {

    var authorizedStoryHandler: (() -> Void)?
    private let services: ApplicationServices
    private let navigationController: UINavigationController

    private var loginCoordinator: Coordinator?
    private var registrationCoordinator: Coordinator?

    init(services: ApplicationServices, navigationController: UINavigationController) {
        self.services = services
        self.navigationController = navigationController
    }

    private func startLoginCoordinator(with navigationController: UINavigationController) {
        let loginCoordinator = LoginCoordinator(services: services, navigationController: navigationController)
        loginCoordinator.authorizedStoryHandler = authorizedStoryHandler
        self.loginCoordinator = loginCoordinator
        self.loginCoordinator?.start()
    }

    private func startRegistrationCoordinator(with navigationController: UINavigationController) {
        let registrationCoordinator = RegistrationCoordinator(services: services, navigationController: navigationController)
        registrationCoordinator.authorizedStoryHandler = authorizedStoryHandler
        self.registrationCoordinator = registrationCoordinator
        self.registrationCoordinator?.start()
    }
}

extension HomeScreenCoordinator: Coordinator {
    public func start() {
        let vc = HomeScreenConfigurator.createModule(with: services, routeDelegate: self)
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.setViewControllers([vc], animated: false)
    }
}

extension HomeScreenCoordinator: HomeScreenModuleDelegate {
    func loginToApp() {
        startLoginCoordinator(with: navigationController)
    }

    func registrationInApplication() {
        startRegistrationCoordinator(with: navigationController)
    }
}
