//
//  UINavigationController+hideBackButtonTitle.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

extension UINavigationController {

    func pushViewControllerWithoutBackButtonTitle(_ viewController: UIViewController, animated: Bool = true) {
        viewControllers.last?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        pushViewController(viewController, animated: animated)
    }
}
