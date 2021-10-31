//
//  RegistrationProtocols.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

protocol RegistrationInteractor {
    func loadedView()
    func confirmCode()
    func login()
}

protocol RegistrationPresenter {
}

protocol RegistrationView: AnyObject {
}

protocol RegistrationRouter: AnyObject {
    func showConfirmScreen()
    func loginToApp()
}
