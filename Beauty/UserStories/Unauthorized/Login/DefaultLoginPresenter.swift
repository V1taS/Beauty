//
//  DefaultLoginPresenter.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

final class DefaultLoginPresenter {

    weak var view: LoginView?

    init(view: LoginView) {
        self.view = view
    }
}

extension DefaultLoginPresenter: LoginPresenter {
    func handle() {
        
    }
}
