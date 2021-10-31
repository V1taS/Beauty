//
//  DefaultRestorePasswordPresenter.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

final class DefaultRestorePasswordPresenter {

    weak var view: RestorePasswordView?

    init(view: RestorePasswordView) {
        self.view = view
    }
}

extension DefaultRestorePasswordPresenter: RestorePasswordPresenter {
    func handle() {
        
    }
}
