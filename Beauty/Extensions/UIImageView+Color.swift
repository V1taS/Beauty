//
//  UIImageView+Color.swift
//  Beauty
//
//  Created by Vitalii Sosin on 02.11.2021.
//

import UIKit

extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
