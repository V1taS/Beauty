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
    private var mainCoordinator: Coordinator?

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
            let tabVC: UITabBarController = .bankStyled

            // первый экран
            let mainNavigation = UINavigationController()
            let mainCoordinator = MainCoordinator(services: applicationServices, navigationController: mainNavigation)
            mainCoordinator.unauthorizedStoryHandler = unauthorizedStoryHandler
            self.mainCoordinator = mainCoordinator
            self.mainCoordinator?.start()
            mainNavigation.tabBarItem = UITabBarItem(title: String.TabBar.first, image: UIImage.TabBar.first, selectedImage: nil)

            // второй экран
            let mainPaymentsNavigation = UINavigationController()
            mainPaymentsNavigation.view.backgroundColor = .white
            mainPaymentsNavigation.tabBarItem = UITabBarItem(title: String.TabBar.second, image: UIImage.TabBar.second, selectedImage: nil)

            // третий экран
            let mainChatNavigation = UINavigationController()
            mainChatNavigation.view.backgroundColor = .white
            mainChatNavigation.tabBarItem = UITabBarItem(title: String.TabBar.third, image: UIImage.TabBar.third, selectedImage: nil)

            tabVC.viewControllers = [mainNavigation, mainPaymentsNavigation, mainChatNavigation]

            navigationController.setViewControllers([tabVC], animated: false)
            navigationController.setNavigationBarHidden(true, animated: false)
        } else {
            let vc = createAuthentication(skipVisible: false)
            navigationController.pushViewControllerWithoutBackButtonTitle(vc, animated: true)
            clearPreviousFromNavigationStack()
        }
    }
}

extension AuthenticationCoordinator: AuthenticationInfoRouterDelegate {

    func authInfoSkipTapped() {
        authorizedStoryHandler?()
    }

    func startPasscodeEnter() {
//        if authorized {
//            let vc = createBiometrics()
//            navigationController.pushViewControllerWithoutBackButtonTitle(vc, animated: true)
//        } else {
//            let vc = SMSInputConfigurator.createModule(with: applicationServices, routeDelegate: self)
//            navigationController.pushViewControllerWithoutBackButtonTitle(vc, animated: true)
//            clearPreviousFromNavigationStack()
//        }
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
