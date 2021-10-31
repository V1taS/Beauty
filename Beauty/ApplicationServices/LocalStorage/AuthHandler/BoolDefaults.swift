//
//  BoolDefaults.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import Foundation

@propertyWrapper
public struct BoolDefaults {

    private let key: String

    init(key: String) {
        self.key = key
    }

    public var wrappedValue: Bool {
        get {
            DefaultsWrapper.bool(for: key)
        }
        set {
            DefaultsWrapper.set(newValue, for: key)
        }
    }
}
