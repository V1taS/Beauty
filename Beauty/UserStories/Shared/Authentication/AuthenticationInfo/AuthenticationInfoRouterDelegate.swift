//
//  AuthenticationInfoRouterDelegate.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import Foundation

protocol AuthenticationInfoRouterDelegate: AnyObject {
    func startPasscodeEnter()
    func authInfoSkipTapped()
}
