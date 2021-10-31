//
//  UseBiometricsConfigurator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

enum UseBiometricsConfigurator {

    static func createModule(with services: ApplicationServices, routeDelegate: UseBiometricsDelegate) -> UIViewController {
        let vc = UseBiometricsVC()
        vc.router = routeDelegate
        vc.biometricService = services.biometricService
        return vc
    }
}

