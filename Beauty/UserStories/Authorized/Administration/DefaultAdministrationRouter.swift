//
//  DefaultAdministrationRouter.swift
//  Beauty
//
//  Created by Vitalii Sosin on 06.11.2021.
//  
//

import Foundation

protocol AdministrationModuleDelegate: AnyObject {

}

final class DefaultAdministrationRouter {
    weak var delegate: AdministrationModuleDelegate?
}

extension DefaultAdministrationRouter: AdministrationRouter {
}
