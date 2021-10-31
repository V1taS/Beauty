//
//  BiometricsConstants.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

enum BiometricsConstants {
    static let createCodeInfo = "Создайте код или подключите \n %@ для быстрого входа"
    static let createCodeInfoNoBiometry = "Создайте код"
    static let startTitle = "Начать"
    static let doNotShowThisMessageText = "Больше не показывать это сообщение"
    static let biometricsUseTitle = "Используйте %@ \nдля входа в приложение"

    static let touchIDText = "Touch ID"
    static let faceIDText = "Face ID"
    static let skipText = "Пропустить"
    static let addBiometryText = "Привязать %@"

    static let defaultCircleSize: CGFloat = 144
    static let minCircleSize: CGFloat = 80
    static let defaultViewPadding: CGFloat = GlobalConstants.defaultPadding
    static let defaultCirclePadding: CGFloat = 25
    static let defaultCenterYPadding: CGFloat = 25
    static let buttonHeight: CGFloat = 52
    static let fontSize: CGFloat = 14

    static let startBiometricsCirclePadding: CGFloat = 40
}

