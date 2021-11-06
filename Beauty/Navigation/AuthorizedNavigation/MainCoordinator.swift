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
    private var administrationCoordinator: Coordinator?

    var unauthorizedStoryHandler: (() -> Void)?

    // MARK: - Initialization
    init(services: ApplicationServices, navigationController: UINavigationController) {
        self.services = services
        self.navigationController = navigationController
    }

    private func startAdministrationCoordinator(with navigationController: UINavigationController) {
        let administrationCoordinator = AdministrationCoordinator(services: services, navigationController: navigationController)
        administrationCoordinator.unauthorizedStoryHandler = unauthorizedStoryHandler
        self.administrationCoordinator = administrationCoordinator
        self.administrationCoordinator?.start()
    }
}

extension MainCoordinator: Coordinator {
    public func start() {
        let vc = MainConfigurator.createModule(with: services, routeDelegate: self)
        navigationController.viewControllers = [vc]
    }
}

extension MainCoordinator: MainModuleDelegate {
    func shareApp() {
        guard let data = URL(string: "https://apps.apple.com/ru/app/random-pro/id1552813956") else { return }
        let vc = UIActivityViewController(activityItems: [data], applicationActivities: [UIActivity()])
        navigationController.present(vc, animated: true, completion: nil)
    }

    func presentAdmin() {
        startAdministrationCoordinator(with: navigationController)
    }

    func exitApp() {
        unauthorizedStoryHandler?()
    }
}
