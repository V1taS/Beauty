//
//  StartBiometricsConfigurator.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

enum StartBiometricsConfigurator {

    static func createModule(with services: ApplicationServices, routeDelegate: StartBiometricsDelegate) -> UIViewController {
        let vc = StartBiometricsVC()
        vc.routeDelegate = routeDelegate
        vc.biometricService = services.biometricService
        return vc
    }
}

