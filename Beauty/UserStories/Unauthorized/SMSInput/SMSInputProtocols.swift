//
//  SMSInputProtocols.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

protocol SMSInputInteractor {
    func loadedView()
}

protocol SMSInputPresenter {
}

protocol SMSInputView: AnyObject {
}

protocol SMSInputRouter: AnyObject {
    func showMainScreen()
}
