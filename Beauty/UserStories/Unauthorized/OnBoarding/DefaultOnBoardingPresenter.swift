//
//  DefaultOnBoardingPresenter.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

final class DefaultOnBoardingPresenter {

    weak var view: OnBoardingView?

    init(view: OnBoardingView) {
        self.view = view
    }
}

extension DefaultOnBoardingPresenter: OnBoardingPresenter {
}
