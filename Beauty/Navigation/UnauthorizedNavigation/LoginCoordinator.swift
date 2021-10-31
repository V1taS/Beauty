//
//  LoginCoordinator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 30.10.2021.
//

import UIKit

final class LoginCoordinator {

    var authorizedStoryHandler: (() -> Void)?
    private let services: ApplicationServices
    private let navigationController: UINavigationController

    private var registrationCoordinator: Coordinator?
    private var smsInputCoordinator: Coordinator?

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

    private func startRegistrationCoordinator(with navigationController: UINavigationController) {
        let registrationCoordinator = RegistrationCoordinator(services: services, navigationController: navigationController)
        registrationCoordinator.authorizedStoryHandler = authorizedStoryHandler
        self.registrationCoordinator = registrationCoordinator
        self.registrationCoordinator?.start()
    }
}

extension LoginCoordinator: Coordinator {
    public func start() {
        let vc = LoginConfigurator.createModule(with: services, routeDelegate: self)
        navigationController.modalPresentationStyle = .pageSheet
        navigationController.present(vc, animated: true, completion: nil)
    }
}

extension LoginCoordinator: LoginModuleDelegate {
    func showConfirmScreen() {
        self.navigationController.dismiss(animated: true)
        startSMSInputCoordinator(with: navigationController)
    }

    func registrationInApplication() {
        self.navigationController.dismiss(animated: true)
        startRegistrationCoordinator(with: navigationController)
    }
}
