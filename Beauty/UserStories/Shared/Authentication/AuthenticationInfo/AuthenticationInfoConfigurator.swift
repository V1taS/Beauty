//
//  AuthenticationInfoConfigurator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

enum AuthenticationInfoConfigurator {

    static func createModule(with services: ApplicationServices, routeDelegate: AuthenticationInfoRouterDelegate, skipVisible: Bool) -> UIViewController {
            let vc = AuthenticationInfoVC()
            vc.routeDelegate = routeDelegate
            vc.biometricService = services.biometricService
            return vc
    }
}
