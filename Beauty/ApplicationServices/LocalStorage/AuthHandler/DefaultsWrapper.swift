//
//  DefaultsWrapper.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

enum DefaultsWrapper {

    static let showBiometricsAuthentication = "showBiometricsAuthentication"
    static let biometricsAuthSuccessful = "biometricsAuthSuccessful"
    static let authenticated = "authenticated"
    static let savedURLKey = "savedURLKey"
    static let savedLogin = "savedLogin"

    private static let onBoardingKey = "onBoardingKey"
    private static let authKey = "authKey"

    static func set(authorized auth: Bool) {
        UserDefaults.standard.set(auth, forKey: authKey)
        UserDefaults.standard.synchronize()
    }

    static func set(onBoarded auth: Bool) {
        UserDefaults.standard.set(auth, forKey: onBoardingKey)
        UserDefaults.standard.synchronize()
    }

    static func isAuthorized() -> Bool {
        UserDefaults.standard.bool(forKey: authKey)
    }

    static func isOnBoarded() -> Bool {
        UserDefaults.standard.bool(forKey: onBoardingKey)
    }

    static func set(_ value: Bool, for key: String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }

    static func bool(for key: String) -> Bool {
        UserDefaults.standard.bool(forKey: key)
    }

    static func set(_ value: String, for key: String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }

    static func string(for key: String) -> String {
        UserDefaults.standard.string(forKey: key) ?? ""
    }
}
