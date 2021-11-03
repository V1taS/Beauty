//
//  DefaultSupportPresenter.swift
//  Beauty
//
//  Created by Vitalii Sosin on 04.11.2021.
//  
//

import Foundation

final class DefaultSupportPresenter {

    weak var view: SupportView?

    init(view: SupportView) {
        self.view = view
    }
}

extension DefaultSupportPresenter: SupportPresenter {
}
