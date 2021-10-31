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
}

protocol OnBoardingView: AnyObject {
}

protocol OnBoardingRouter: AnyObject {
    func showStartScreen()
}
