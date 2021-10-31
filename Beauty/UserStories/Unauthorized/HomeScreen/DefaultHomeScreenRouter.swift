//
//  DefaultHomeScreenRouter.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

protocol HomeScreenModuleDelegate: AnyObject {
    func loginToApp()
    func registrationInApplication()
}

final class DefaultHomeScreenRouter {
    weak var delegate: HomeScreenModuleDelegate?
}

extension DefaultHomeScreenRouter: HomeScreenRouter {
    func loginToApp() {
        delegate?.loginToApp()
    }

    func registrationInApplication() {
        delegate?.registrationInApplication()
    }
}
