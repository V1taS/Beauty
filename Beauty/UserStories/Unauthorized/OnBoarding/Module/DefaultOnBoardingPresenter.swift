//
//  DefaultOnBoardingPresenter.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import UIKit

final class DefaultOnBoardingPresenter {

    weak var view: OnBoardingView?

    init(view: OnBoardingView) {
        self.view = view
    }
}

extension DefaultOnBoardingPresenter: OnBoardingPresenter {

    func handle() {
        let model: [OnBoardingModel] = [
            OnBoardingModel(backgroundImage: UIImage.OnBoarding.Background.first,
                            title: String.OnBoarding.Page.FirstPage.title,
                            description: String.OnBoarding.Page.FirstPage.description),
            OnBoardingModel(backgroundImage: UIImage.OnBoarding.Background.second,
                            title: String.OnBoarding.Page.SecondPage.title,
                            description: String.OnBoarding.Page.SecondPage.description),
            OnBoardingModel(backgroundImage: UIImage.OnBoarding.Background.third,
                            title: String.OnBoarding.Page.ThirdPage.title,
                            description: String.OnBoarding.Page.ThirdPage.description),
        ]

        view?.updateView(model)
    }
}
