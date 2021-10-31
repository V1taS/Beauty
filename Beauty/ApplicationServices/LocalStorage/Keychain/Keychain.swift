//
//  Keychain.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import Foundation

public enum KeychainConstants {
    public static let initialAuthKey = "initialAuthKey"
    public static let initialAuthTokenKey = "initialAuthTokenKey"
    public static let confirmTokenKey = "confirmTokenKey"
    public static let biometricsDomainState = "biometricsDomainState"
    public static let uniqueDeviceID = "uniqueDeviceID"
    public static let passcodeKey = "passcodeKey"
}

public protocol Keychain {
    @discardableResult
    func set(_ value: String, for key: String) -> Bool
    func value(for key: String) -> String?
}
