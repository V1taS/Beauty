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

// MARK: - OnBoarding Screen
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

// MARK: - HomeScreen
extension UIImage {
    enum HomeScreen {
        enum Background {
            static var image: UIImage { UIImage(named: "launchScreen")! }
        }

        enum Button {
            static var close: UIImage { UIImage(systemName: "xmark")! }
        }
    }
}

extension UIColor {
    enum HomeScreen {
        enum Label {
            static var title: UIColor { UIColor.white }
            static var description: UIColor { UIColor.white }
        }

        enum Button {
            static var loginButtonTitle: UIColor { UIColor.white }
            static var loginButtonBg: UIColor { UIColor(hex: 0xC270E0) }
            static var registrationButtonTitle: UIColor { UIColor.white }
            static var registrationButtonBg: UIColor { UIColor(hex: 0xFF8181) }
        }

        enum Stack {
            static var bg: UIColor { UIColor(hex: 0xF0F3F6) }
        }

        enum SocialNetworkLabels {
            static var first: UIColor { UIColor(hex: 0x91919F) }
            static var second: UIColor { UIColor(hex: 0x91919F) }
        }
    }
}

extension String {
    enum HomeScreen {
        enum Button {
            static var loginButton: String { "Войти" }
            static var registrationButton: String { "Зарегистрироваться" }
        }

        enum SocialNetworkLabels {
            static var first: String { "@TikTok" }
            static var second: String { "@Instagramm" }
        }
    }
}

extension UIFont {
    enum HomeScreen {
        enum SocialNetworkLabels {
            static var first: UIFont { UIFont.systemFont(ofSize: 12, weight: .regular) }
            static var second: UIFont { UIFont.systemFont(ofSize: 12, weight: .regular) }
        }
    }
}

// MARK: - RegistrationVC
extension UIColor {
    enum Registration {
        enum Labels {
            static var title: UIColor { UIColor.black }
        }

        enum Button {
            static var continueButtonTitle: UIColor { UIColor.white }
            static var continueButtonButtonBg: UIColor { UIColor(hex: 0xC270E0) }

            static var loginButtonTitle: UIColor { UIColor(hex: 0xC270E0) }
            static var loginButtonBg: UIColor { UIColor.clear }
            static var loginButtonBorder: UIColor { UIColor(hex: 0xC270E0) }
        }

        enum Background {
            static var color: UIColor { UIColor(hex: 0xF1F1FA) }
        }

        enum TextField {
            static var background: UIColor { UIColor.white }
        }
    }
}

extension UIFont {
    enum Registration {
        static var title: UIFont { UIFont.systemFont(ofSize: 24, weight: .bold) }
    }
}

extension String {
    enum Registration {
        enum Button {
            static var continueButton: String { "Продолжить" }
            static var loginButton: String { "Войти" }
        }

        enum Labels {
            static var title: String { "Регистрация" }
        }

        enum TextFields {
            static var name: String { "Имя" }
            static var surname: String { "Фамилия" }
            static var phone: String { "Введите номер" }
        }
    }
}

// MARK: - Login
extension UIColor {
    enum Login {
        enum Labels {
            static var title: UIColor { UIColor.black }
        }

        enum Button {
            static var continueButtonTitle: UIColor { UIColor.white }
            static var continueButtonButtonBg: UIColor { UIColor(hex: 0xC270E0) }

            static var registrationButtonTitle: UIColor { UIColor(hex: 0xC270E0) }
            static var registrationButtonBg: UIColor { UIColor.clear }
            static var registrationButtonBorder: UIColor { UIColor(hex: 0xC270E0) }
        }

        enum Background {
            static var color: UIColor { UIColor(hex: 0xF1F1FA) }
        }

        enum TextField {
            static var background: UIColor { UIColor.white }
        }
    }
}

extension String {
    enum Login {
        enum Button {
            static var continueButton: String { "Продолжить" }
            static var registrationButton: String { "Регистрация" }
        }

        enum Labels {
            static var title: String { "Войти" }
        }

        enum TextFields {
            static var phone: String { "Введите номер" }
        }
    }
}

extension UIFont {
    enum Login {
        static var title: UIFont { UIFont.systemFont(ofSize: 24, weight: .bold) }
    }
}

// MARK: - SMS Input
extension UIColor {
    enum SMSInput {
        enum Labels {
            static var title: UIColor { UIColor.black }
        }

        enum Button {
            static var continueButtonTitle: UIColor { UIColor.white }
            static var continueButtonButtonBg: UIColor { UIColor(hex: 0xC270E0) }
        }

        enum Background {
            static var color: UIColor { UIColor(hex: 0xF1F1FA) }
        }

        enum TextField {
            static var background: UIColor { UIColor.white }
        }
    }
}

extension String {
    enum SMSInput {
        enum Button {
            static var continueButton: String { "Продолжить" }
        }

        enum Labels {
            static var title: String { "СМС подтверждение" }
        }

        enum TextFields {
            static var phone: String { "Введите код из смс" }
        }
    }
}

extension UIFont {
    enum SMSInput {
        static var title: UIFont { UIFont.systemFont(ofSize: 24, weight: .bold) }
    }
}
