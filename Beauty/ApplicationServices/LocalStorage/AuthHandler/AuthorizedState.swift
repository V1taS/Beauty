//
//  AuthorizedState.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import Foundation

@propertyWrapper
public struct AuthorizedState {

    public init() {}

    public var wrappedValue: Bool {
        get {
            DefaultsWrapper.isAuthorized()
        }
        set {
            DefaultsWrapper.set(authorized: newValue)
        }
    }
}
