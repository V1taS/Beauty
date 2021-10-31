//
//  DefaultSMSInputPresenter.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

final class DefaultSMSInputPresenter {

    weak var view: SMSInputView?

    init(view: SMSInputView) {
        self.view = view
    }
}

extension DefaultSMSInputPresenter: SMSInputPresenter {
}
