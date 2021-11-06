//
//  DefaultAdministrationPresenter.swift
//  Beauty
//
//  Created by Vitalii Sosin on 06.11.2021.
//  
//

import Foundation

final class DefaultAdministrationPresenter {

    weak var view: AdministrationView?

    init(view: AdministrationView) {
        self.view = view
    }
}

extension DefaultAdministrationPresenter: AdministrationPresenter {
}
