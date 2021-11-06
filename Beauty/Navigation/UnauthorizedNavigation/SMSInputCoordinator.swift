//
//  SMSInputCoordinator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

final class SMSInputCoordinator {

    var authorizedStoryHandler: (() -> Void)?
    private let services: ApplicationServices
    private let navigationController: UINavigationController

    private var authenticatedCoordinator: Coordinator?

    init(services: ApplicationServices, navigationController: UINavigationController) {
        self.services = services
        self.navigationController = navigationController
    }
}

extension SMSInputCoordinator: Coordinator {
    public func start() {
        self.navigationController.dismiss(animated: true)
        let vc = SMSInputConfigurator.createModule(with: services, routeDelegate: self)
        navigationController.modalPresentationStyle = .pageSheet
        navigationController.present(vc, animated: true, completion: nil)
    }
}

extension SMSInputCoordinator: SMSInputModuleDelegate {
    func showMainScreen() {
        self.navigationController.dismiss(animated: true)
        authorizedStoryHandler?()
    }
}
