//
//  BiometricAuthService.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import Foundation

public protocol BiometricAuthService {
    var type: BiometricType { get }

    func authorize(with completion: ((BiometricAuthResult) -> Void)?)
    func invalidate()
}
