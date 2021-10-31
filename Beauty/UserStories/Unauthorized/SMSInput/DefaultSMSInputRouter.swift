//
//  DefaultSMSInputRouter.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

protocol SMSInputModuleDelegate: AnyObject {
    func showMainScreen()
}

final class DefaultSMSInputRouter {
    weak var delegate: SMSInputModuleDelegate?
}

extension DefaultSMSInputRouter: SMSInputRouter {
    func showMainScreen() {
        delegate?.showMainScreen()
    }
}
