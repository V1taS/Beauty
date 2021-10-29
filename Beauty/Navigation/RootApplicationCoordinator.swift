//
//  RootApplicationCoordinator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 30.10.2021.
//

import UIKit

public final class RootApplicationCoordinator {

    // MARK: - Private variables
    private let applicationServices: ApplicationServices
    private let window: UIWindow?
    private var mainCleanerCoordinator: Coordinator?

    // MARK: - Initialization
    public init(applicationServices: ApplicationServices, window: UIWindow?) {
        self.applicationServices = applicationServices
        self.window = window
    }

    // MARK: - Private funcs
    private func startCoordinator(with navigationController: UINavigationController) {
        let mainVC = MainCoordinator(services: applicationServices, navigationController: navigationController)
        mainCleanerCoordinator = mainVC
        mainCleanerCoordinator?.start()
    }
}

extension RootApplicationCoordinator: Coordinator {
    public func start() {
        let navigationController = UINavigationController()
        startCoordinator(with: navigationController)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}

