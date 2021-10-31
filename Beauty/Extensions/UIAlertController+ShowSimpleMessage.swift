//
//  UIAlertController+ShowSimpleMessage.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

extension UIAlertController {

    static func alertWithOneButton(title: String, message: String? = nil, action: (()-> Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: Constants.defaultOkButtonText, style: .default, handler: { btn in
            action?()
        }))
        return alertController
    }

    static func alertWithTwoButton(title: String,
                                   message: String? = nil,
                                   nameButton: String,
                                   actionCancel: (()-> Void)? = nil,
                                   actionDefault: (()-> Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: Constants.defaultCancelButtonText, style: .cancel, handler: { btn in
            actionCancel?()
        }))

        alertController.addAction(UIAlertAction(title: nameButton, style: .default, handler: { btn in
            actionDefault?()
        }))
        return alertController
    }
}

private enum Constants {
    static var defaultOkButtonText: String { "OK" }
    static var defaultCancelButtonText: String { "Отмена" }
}


