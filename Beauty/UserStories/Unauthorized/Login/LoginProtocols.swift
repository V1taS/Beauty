//
//  LoginProtocols.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

protocol LoginInteractor {
    func loadedView()
    func confirmCode()
    func registration()
}

protocol LoginPresenter {
    func handle()
}

protocol LoginView: AnyObject {
    func update()
}

protocol LoginRouter: AnyObject {
    func showConfirmScreen()
    func registrationInApplication()
}
