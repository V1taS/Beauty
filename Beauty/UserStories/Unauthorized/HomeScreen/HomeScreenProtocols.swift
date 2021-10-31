//
//  HomeScreenProtocols.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

protocol HomeScreenInteractor {
    func loadedView()
    func login(username: String, password: String)
    func registration(username: String, password: String)
}

protocol HomeScreenPresenter {
}

protocol HomeScreenView: AnyObject {
}

protocol HomeScreenRouter: AnyObject {
    func loginToApp()
    func registrationInApplication()
}
