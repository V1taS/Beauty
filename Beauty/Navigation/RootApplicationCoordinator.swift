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
    private var unauthorizedCoordinator: Coordinator?
    private var authenticatedCoordinator: AuthenticatedCoordinator?
    private var passcodeCoordinator: Coordinator?

//    @AuthorizedState
//    private var authorized: Bool
    private var authorized = false

    @BoolDefaults(key: DefaultsWrapper.biometricsAuthSuccessful)
    private var biometricsAuthSuccessful: Bool

    @BoolDefaults(key: DefaultsWrapper.authenticated)
    private var authenticated: Bool

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Initialization
    public init(applicationServices: ApplicationServices, window: UIWindow?) {
        self.applicationServices = applicationServices
        self.window = window
    }

    private func startAppropriateCoordinator(with navigationController: UINavigationController) {
        if authorized {
            // авторизованный пользователь
            startAuthenticatedCoordinator(with: navigationController)
        } else {
            // не авторизованный пользователь
            startUnauthorizedCoordinator(with: navigationController)
        }
    }


    // старт не авторизованный пользователь
    private func startUnauthorizedCoordinator(with navigationController: UINavigationController) {
        authenticated = false
        let unauthCoordinator = UnauthorizedCoordinator(applicationServices: applicationServices, navigationController: navigationController)
        unauthCoordinator.authorizedStoryHandler = { [weak self] in
            guard let self = self else { return }
            self.authorized = true
            self.authenticated = true
            self.startAuthenticatedCoordinator(with: navigationController)
        }
        unauthorizedCoordinator = unauthCoordinator
        unauthorizedCoordinator?.start()
        authenticatedCoordinator = nil
    }

    // запустить авторизованный координатор
    private func startAuthenticatedCoordinator(with navigationController: UINavigationController) {
        self.authenticated = true

        let authCoordinator = AuthenticatedCoordinator(services: applicationServices, navigationController: navigationController)

        authCoordinator.unauthorizedStoryHandler = { [weak self] in
            guard let self = self else { return }
            self.authorized = false
            self.authenticated = false
            self.biometricsAuthSuccessful = false

            // запустить неавторизованный координатор
            self.startUnauthorizedCoordinator(with: navigationController)
        }

        authenticatedCoordinator = authCoordinator
        authenticatedCoordinator?.start()
        passcodeCoordinator = nil
        unauthorizedCoordinator = nil
    }

    // MARK: - Private funcs
}

extension RootApplicationCoordinator: Coordinator {
    public func start() {
        let navigationController = UINavigationController()
        startAppropriateCoordinator(with: navigationController)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}
