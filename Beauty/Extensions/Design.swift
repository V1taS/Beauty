//
//  UILabel+Design.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

extension UILabel {

    func applyInfoDesign() {
        font = UIFont.systemFont(ofSize: 14, weight: .medium)
        numberOfLines = 0
        textAlignment = .center
    }
}


// MARK: - TabBar
extension UIImage {
    enum TabBar {
        static var first: UIImage { UIImage(named: "firstTabBarIcon")! }
        static var second: UIImage { UIImage(named: "secondTabBarIcon")! }
        static var third: UIImage { UIImage(named: "thirdTabBarIcon")! }
    }
}

extension String {
    enum TabBar {
        static var first: String { "Главная" }
        static var second: String { "Запись" }
        static var third: String { "Поддержка" }
    }
}

extension UITabBarController {

    static var bankStyled: UITabBarController {
        let vc = UITabBarController()
        vc.tabBar.unselectedItemTintColor = UIColor.black
        vc.tabBar.tintColor = UIColor.purple
        return vc
    }
}

