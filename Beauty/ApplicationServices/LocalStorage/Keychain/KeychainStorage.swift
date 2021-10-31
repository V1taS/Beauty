//
//  KeychainStorage.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

@propertyWrapper
public struct KeychainStorage {

    private let key: String
    private let encrypted: Bool

    public init(key: String, encrypted: Bool = false) {
        self.encrypted = encrypted
        self.key = key
    }

    public var wrappedValue: String {
        get {
            let keychain: Keychain = KeychainFactory.createKeychain()
            let value = keychain.value(for: key) ?? ""
            return value
        }
        set {
            let keychain: Keychain = KeychainFactory.createKeychain()
            if let encryptedString = newValue.aes256Encrypted, encrypted {
                keychain.set(encryptedString, for: key)
            } else {
                keychain.set(newValue, for: key)
            }
        }
    }
}
