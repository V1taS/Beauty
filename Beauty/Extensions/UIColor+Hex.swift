//
//  UIColor+Hex.swift
//  Beauty
//
//  Created by Vitalii Sosin on 02.11.2021.
//

import UIKit

/// UIColor(hex: 0xFCF4EC)
extension UIColor {
    convenience init(hex: Int) {
        self.init(
            red: CGFloat((hex >> 16) & 0xFF) / 255.0,
            green: CGFloat((hex >> 8) & 0xFF) / 255.0,
            blue: CGFloat(hex & 0xFF) / 255.0,
            alpha: 1.0
        )
    }
}
