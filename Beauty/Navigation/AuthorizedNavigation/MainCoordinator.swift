//
//  MainCoordinator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 30.10.2021.
//

import UIKit

public final class MainCoordinator {

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

extension MainCoordinator: Coordinator {
    public func start() {
        let vc = MainConfigurator.createModule(with: services)
        navigationController.viewControllers = [vc]
    }
}
