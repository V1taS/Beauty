//
//  AdministrationCoordinator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 06.11.2021.
//

import UIKit

public final class AdministrationCoordinator {

    // MARK: - Private variables
    private let navigationController: UINavigationController
    private let services: ApplicationServices
    private var administrationCoordinator: Coordinator?

    var unauthorizedStoryHandler: (() -> Void)?

    // MARK: - Initialization
    init(services: ApplicationServices, navigationController: UINavigationController) {
        self.services = services
        self.navigationController = navigationController
    }
}

extension AdministrationCoordinator: Coordinator {
    public func start() {
        let vc = AdministrationConfigurator.createModule(with: services, routeDelegate: self)
        navigationController.modalPresentationStyle = .pageSheet
        navigationController.present(vc, animated: true, completion: nil)
    }
}

extension AdministrationCoordinator: AdministrationModuleDelegate {

}
