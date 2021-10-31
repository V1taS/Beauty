//
//  KeychainService.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import Foundation

class KeychainService: Keychain {

    private let keychainWrapper = KeychainWrapper.defaultKeychainWrapper()

    func set(_ value: String, for key: String) -> Bool {
        return keychainWrapper.setString(value, forKey: key)
    }

    func value(for key: String) -> String? {
        return keychainWrapper.stringForKey(key)
    }
}
