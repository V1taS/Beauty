//
//  AuthenticationCoordinator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 30.10.2021.
//

import UIKit

final class AuthenticationCoordinator {
    var authorizedStoryHandler: (() -> Void)?
    var unauthorizedStoryHandler: (() -> Void)?

    private let applicationServices: ApplicationServices
    private let navigationController: UINavigationController
    private let authorized: Bool

    @AuthorizedState
    private var authorizedState: Bool

    @BoolDefaults(key: DefaultsWrapper.showBiometricsAuthentication)
    private var showBiometricsConfiguration: Bool

    @BoolDefaults(key: DefaultsWrapper.biometricsAuthSuccessful)
    private var biometricsAuthSuccessful: Bool

    init(applicationServices: ApplicationServices, navigationController: UINavigationController, authorized: Bool) {
        self.applicationServices = applicationServices
        self.navigationController = navigationController
        self.authorized = authorized
    }

    private func clearPreviousFromNavigationStack() {
        navigationController.viewControllers.remove(at: 1)
    }

    private func createStartBiometrics() -> UIViewController {
        StartBiometricsConfigurator.createModule(with: applicationServices, routeDelegate: self)
    }

    private func createAuthentication(skipVisible: Bool) -> UIViewController {
        AuthenticationInfoConfigurator.createModule(with: applicationServices, routeDelegate: self, skipVisible: skipVisible)
    }

    private func createBiometrics() -> UIViewController {
        UseBiometricsConfigurator.createModule(with: applicationServices, routeDelegate: self)
    }
}

extension AuthenticationCoordinator: Coordinator {

    func start() {
        if authorized {
            let vc = PasscodeConfigurator.createModuleEnterPwdState(with: applicationServices, delegate: self)
            navigationController.viewControllers = [vc]
        } else {
            let vc = createAuthentication(skipVisible: false)
            navigationController.pushViewControllerWithoutBackButtonTitle(vc, animated: true)
            clearPreviousFromNavigationStack()
        }
    }
}

extension AuthenticationCoordinator: PasscodeRouterDelegate {

    func exitTapped() {
        unauthorizedStoryHandler?()
    }

    func passcodeEnteredCorrectly() {
        if showBiometricsConfiguration && !biometricsAuthSuccessful && applicationServices.biometricService.type != .none {
            let vc = createAuthentication(skipVisible: true)
            navigationController.viewControllers = [vc]
        } else {
            authorizedStoryHandler?()
        }
    }

    func passcodeCreated() {
        if applicationServices.biometricService.type == .none {
            authorizedStoryHandler?()
        } else {
            authorizedState = true
            let vc = createStartBiometrics()
            navigationController.viewControllers = [vc]
        }
    }
}

extension AuthenticationCoordinator: AuthenticationInfoRouterDelegate {

    func authInfoSkipTapped() {
        authorizedStoryHandler?()
    }

    func startPasscodeEnter() {
        if authorized {
            let vc = createBiometrics()
            navigationController.pushViewControllerWithoutBackButtonTitle(vc, animated: true)
        } else {
            let vc = PasscodeConfigurator.createModuleCreatePwdState(with: applicationServices, delegate: self)
            navigationController.pushViewControllerWithoutBackButtonTitle(vc, animated: true)
            clearPreviousFromNavigationStack()
        }
    }
}

extension AuthenticationCoordinator: StartBiometricsDelegate {

    func addBiometrics() {
        let vc = createBiometrics()
        navigationController.pushViewControllerWithoutBackButtonTitle(vc, animated: true)
    }

    func skipTapped() {
        authorizedStoryHandler?()
    }
}

extension AuthenticationCoordinator: UseBiometricsDelegate {

    func biometricsFinished() {
        authorizedStoryHandler?()
    }
}
