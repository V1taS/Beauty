//
//  DefaultRegistrationPresenter.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

final class DefaultRegistrationPresenter {

    weak var view: RegistrationView?

    init(view: RegistrationView) {
        self.view = view
    }
}

extension DefaultRegistrationPresenter: RegistrationPresenter {
}
