//
//  DefaultMainRouter.swift
//  Beauty
//
//  Created by Vitalii Sosin on 30.10.2021.
//  
//

import Foundation

protocol MainModuleDelegate: AnyObject {
    func exitApp()
    func shareApp()
    func presentAdmin()
}

final class DefaultMainRouter {
    weak var delegate: MainModuleDelegate?
}

extension DefaultMainRouter: MainRouter {
    func presentAdmin() {
        delegate?.presentAdmin()
    }

    func shareApp() {
        delegate?.shareApp()
    }

    func exitApp() {
        delegate?.exitApp()
    }
}
