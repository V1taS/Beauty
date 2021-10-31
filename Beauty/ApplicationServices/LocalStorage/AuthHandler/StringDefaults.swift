//
//  StringDefaults.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import Foundation

@propertyWrapper
public struct StringDefaults {
    
    private let key: String

    init(key: String) {
        self.key = key
    }

    public var wrappedValue: String {
        get {
            DefaultsWrapper.string(for: key)
        }
        set {
            DefaultsWrapper.set(newValue, for: key)
        }
    }
}
