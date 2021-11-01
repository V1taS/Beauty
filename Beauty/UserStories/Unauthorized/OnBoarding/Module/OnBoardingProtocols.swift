//
//  OnBoardingProtocols.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

protocol OnBoardingInteractor {
    func loadedView()
    func close()
}

protocol OnBoardingPresenter {
    func handle()
}

protocol OnBoardingView: AnyObject {
    func updateView(_ model: [OnBoardingModel])
}

protocol OnBoardingRouter: AnyObject {
    func showStartScreen()
}
