//
//  PermissionServiceImpl.swift
//  Beauty
//
//  Created by Vitalii Sosin on 30.10.2021.
//

import Photos

final class PermissionServiceImpl: PermissionService {

    func checkLibraryPermission(_  result: ( @escaping (PermissionResult) -> Void)) {

        let status = PHPhotoLibrary.authorizationStatus()

        switch status {
        case .authorized:
            result(.authorized)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization() { status in
                DispatchQueue.main.async {
                    if status == .authorized {
                        result(.authorized)
                    } else {
                        result(.notAuthorized)
                    }
                }
            }
        case .limited:
            result(.authorized)
        case .denied:
            result(.notAuthorized)
        case .restricted:
            result(.notAuthorized)
        @unknown default:
            result(.notAuthorized)
        }
    }
}

