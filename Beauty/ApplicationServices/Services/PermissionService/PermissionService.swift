//
//  PermissionService.swift
//  Beauty
//
//  Created by Vitalii Sosin on 30.10.2021.
//

import Foundation

public protocol PermissionService {
    func checkLibraryPermission(_  result: ( @escaping (PermissionResult) -> Void))
}
