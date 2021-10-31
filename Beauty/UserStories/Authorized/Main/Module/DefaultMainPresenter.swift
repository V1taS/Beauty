//
//  DefaultMainPresenter.swift
//  Beauty
//
//  Created by Vitalii Sosin on 30.10.2021.
//  
//

import Foundation

final class DefaultMainPresenter {

    weak var view: MainView?

    init(view: MainView) {
        self.view = view
    }
}

extension DefaultMainPresenter: MainPresenter {
}
