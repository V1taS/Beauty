//
//  DefaultHomeScreenPresenter.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

final class DefaultHomeScreenPresenter {

    weak var view: HomeScreenView?

    init(view: HomeScreenView) {
        self.view = view
    }
}

extension DefaultHomeScreenPresenter: HomeScreenPresenter {
}
