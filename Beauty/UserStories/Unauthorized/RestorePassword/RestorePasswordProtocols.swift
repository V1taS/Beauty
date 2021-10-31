//
//  RestorePasswordProtocols.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import Foundation

protocol RestorePasswordInteractor {
    func loadRequisites()
    func filterForm()
    func registerUser()
}

protocol RestorePasswordPresenter {
    func handle()
}

protocol RestorePasswordView: AnyObject {
    func displayError()
    func hideLoadingIndicator()
    func display()
}

protocol RestorePasswordRouter: AnyObject {
    func showSMSInput()
}
