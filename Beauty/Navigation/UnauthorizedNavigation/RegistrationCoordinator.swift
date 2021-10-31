//
//  RegistrationCoordinator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

final class RegistrationCoordinator {

    var authorizedStoryHandler: (() -> Void)?
    private let services: ApplicationServices
    private let navigationController: UINavigationController

    private var smsInputCoordinator: Coordinator?
    private var loginCoordinator: Coordinator?

    init(services: ApplicationServices, navigationController: UINavigationController) {
        self.services = services
        self.navigationController = navigationController
    }

    private func startSMSInputCoordinator(with navigationController: UINavigationController) {
        let smsInputCoordinator = SMSInputCoordinator(services: services, navigationController: navigationController)
        smsInputCoordinator.authorizedStoryHandler = authorizedStoryHandler
        self.smsInputCoordinator = smsInputCoordinator
        self.smsInputCoordinator?.start()
    }

    private func startLoginCoordinator(with navigationController: UINavigationController) {
        let loginCoordinator = LoginCoordinator(services: services, navigationController: navigationController)
        loginCoordinator.authorizedStoryHandler = authorizedStoryHandler
        self.loginCoordinator = loginCoordinator
        self.loginCoordinator?.start()
    }
}

extension RegistrationCoordinator: Coordinator {
    public func start() {
        let vc = RegistrationConfigurator.createModule(with: services, routeDelegate: self)
        navigationController.modalPresentationStyle = .pageSheet
        navigationController.present(vc, animated: true, completion: nil)
    }
}

extension RegistrationCoordinator: RegistrationModuleDelegate {
    func showConfirmScreen() {
        self.navigationController.dismiss(animated: true)
        startSMSInputCoordinator(with: navigationController)
    }
    
    func loginToApp() {
        self.navigationController.dismiss(animated: true)
        startLoginCoordinator(with: navigationController)
    }
}
