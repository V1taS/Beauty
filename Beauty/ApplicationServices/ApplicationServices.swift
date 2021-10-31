//
//  ApplicationServices.swift
//  Beauty
//
//  Created by Vitalii Sosin on 30.10.2021.
//

import Foundation

public protocol ApplicationServices {
    var keyboardService: KeyboardService { get }
    var permissionService: PermissionService { get }
    var biometricService: BiometricAuthService { get }
}

public final class ApplicationServicesImpl: ApplicationServices {

    // MARK: - Public variables
    public var keyboardService: KeyboardService {
        KeyboardServiceImpl()
    }

    public var permissionService: PermissionService {
        PermissionServiceImpl()
    }

    public var biometricService: BiometricAuthService {
        DefaultBiometricAuthService()
    }
}
