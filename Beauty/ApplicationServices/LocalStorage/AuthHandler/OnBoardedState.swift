//
//  OnBoardedState.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import Foundation

@propertyWrapper
public struct OnBoardedState {

    public init() {}

    public var wrappedValue: Bool {
        get {
            DefaultsWrapper.isOnBoarded()
        }
        set {
            DefaultsWrapper.set(onBoarded: newValue)
        }
    }
}
