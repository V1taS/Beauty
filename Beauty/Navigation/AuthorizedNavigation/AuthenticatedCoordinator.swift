//
//  AuthenticatedCoordinator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 30.10.2021.
//

import UIKit

final class AuthenticatedCoordinator {

    var unauthorizedStoryHandler: (() -> Void)?

    private let navigationController: UINavigationController
    private let services: ApplicationServices

    private var mainCoordinator: Coordinator?
    private var supportCoordinator: Coordinator?

    init(services: ApplicationServices, navigationController: UINavigationController) {
        self.services = services
        self.navigationController = navigationController
    }
}

extension AuthenticatedCoordinator: Coordinator {

    func start() {
        let tabVC: UITabBarController = .bankStyled

        // первый экран
        let mainNavigation = UINavigationController()
        let mainCoordinator = MainCoordinator(services: services, navigationController: mainNavigation)
        mainCoordinator.unauthorizedStoryHandler = unauthorizedStoryHandler
        self.mainCoordinator = mainCoordinator
        self.mainCoordinator?.start()
        mainNavigation.tabBarItem = UITabBarItem(title: String.TabBar.first, image: UIImage.TabBar.first, selectedImage: nil)

        // второй экран
        let mainChatNavigation = UINavigationController()
        mainChatNavigation.view.backgroundColor = .white
        mainChatNavigation.tabBarItem = UITabBarItem(title: String.TabBar.second, image: UIImage.TabBar.second, selectedImage: nil)

        // третий экран
        let supportNavigation = UINavigationController()
        let supportCoordinator = SupportCoordinator(services: services, navigationController: supportNavigation)
//        mainCoordinator.unauthorizedStoryHandler = unauthorizedStoryHandler
        self.supportCoordinator = supportCoordinator
        self.supportCoordinator?.start()
        supportNavigation.tabBarItem = UITabBarItem(title: String.TabBar.third, image: UIImage.TabBar.third, selectedImage: nil)

        tabVC.viewControllers = [mainNavigation, mainChatNavigation, supportNavigation]

        navigationController.setViewControllers([tabVC], animated: false)
        navigationController.setNavigationBarHidden(true, animated: false)
    }
}
