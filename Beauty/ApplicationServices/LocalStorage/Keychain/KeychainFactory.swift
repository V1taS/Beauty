//
//  KeychainFactory.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import Foundation

public class KeychainFactory {
    public static func createKeychain() -> Keychain {
        return KeychainService()
    }
}
