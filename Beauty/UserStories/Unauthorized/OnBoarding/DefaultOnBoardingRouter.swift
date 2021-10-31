//
//  DefaultOnBoardingRouter.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

protocol OnBoardingModuleDelegate: AnyObject {
    func showStartScreen()
}

final class DefaultOnBoardingRouter {
    weak var delegate: OnBoardingModuleDelegate?
}

extension DefaultOnBoardingRouter: OnBoardingRouter {

    func showStartScreen() {
        delegate?.showStartScreen()
    }
}
