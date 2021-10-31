//
//  BiometricAuthErrors.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import Foundation

public enum BiometricAuthErrors: Error {
    case biometricsNotAvailable
    case biometricsStateChanged
}

extension BiometricAuthErrors: LocalizedError {

    public var errorDescription: String? {
        switch self {
        case .biometricsNotAvailable:
            return Constants.biometricsNotAvailable
        case .biometricsStateChanged:
            return Constants.biometricsStateChanged
        }
    }
}

private enum Constants {
    static let biometricsNotAvailable = "Аутентификация по биометрии недоступна"
    static let biometricsStateChanged = "Аутентификация по биометрии недоступна. Настройте ее заново"
}

