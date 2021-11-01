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

// MARK: - OnBoarding
extension UIImage {
    enum OnBoarding {
        enum Background {
            static var first: UIImage { UIImage(named: "firstOnBoardingIcon")! }
            static var second: UIImage { UIImage(named: "secondOnBoardingIcon")! }
            static var third: UIImage { UIImage(named: "thirdOnBoardingIcon")! }
        }

        enum Button {
            static var close: UIImage { UIImage(systemName: "xmark")! }
        }
    }
}

extension UIFont {
    enum OnBoarding {
        static var title: UIFont { UIFont.systemFont(ofSize: 24, weight: .bold) }
        static var description: UIFont { UIFont.systemFont(ofSize: 16, weight: .regular) }
    }
}

extension UIColor {
    enum OnBoarding {
        enum Label {
            static var title: UIColor { UIColor.white }
            static var description: UIColor { UIColor.white }
        }

        enum PageControl {
            static var primary: UIColor { UIColor.orange }
            static var secondary: UIColor { UIColor.white }
        }

        enum Button {
            static var close: UIColor { UIColor.white }
            static var nextTitle: UIColor { UIColor.white }
            static var nextBg: UIColor { UIColor.purple }
        }
    }
}

extension String {
    enum OnBoarding {
        enum Page {
            enum FirstPage {
                static var title: String { "Лучший стилист для вас" }
                static var description: String { "Модифицируйте свою внешность в соответствии с вашим стилем жизни" }
            }
            enum SecondPage {
                static var title: String { "Познакомьтесь с нашими специалистами" }
                static var description: String { "Здесь много лучших стилистов из лучших салонов мира." }
            }
            enum ThirdPage {
                static var title: String { "Найдите лучший сервис" }
                static var description: String { "Предлагаются различные услуги от лучших салонов, ставших нашими партнерами." }
            }
        }

        enum Button {
            static var next: String { "Далее" }
            static var start: String { "Начать" }
        }
    }
}
