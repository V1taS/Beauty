//
//  SupportCoordinator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 04.11.2021.
//

import UIKit

public final class SupportCoordinator {

    // MARK: - Private variables
    private let navigationController: UINavigationController
    private let services: ApplicationServices

    var unauthorizedStoryHandler: (() -> Void)?

    // MARK: - Initialization
    init(services: ApplicationServices, navigationController: UINavigationController) {
        self.services = services
        self.navigationController = navigationController
    }
}

extension SupportCoordinator: Coordinator {
    public func start() {
        let vc = SupportConfigurator.createModule(with: services)
        navigationController.viewControllers = [vc]
    }
}
