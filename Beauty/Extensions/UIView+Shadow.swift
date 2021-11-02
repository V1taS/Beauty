//
//  UIView+Shadow.swift
//  Beauty
//
//  Created by Vitalii Sosin on 02.11.2021.
//

import UIKit

extension UIView {

    func applySmallShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 2
    }

    func applyBigShadow(color: UIColor = UIColor.black,
                        opacityColor: CGFloat = 0.2,
                        opacityShadow: Float = 0.4,
                        offSetShadow: CGSize = .zero,
                        radiusShadow: CGFloat = 8) {
        layer.shadowColor = color.withAlphaComponent(opacityColor).cgColor
        layer.shadowOpacity = opacityShadow
        layer.shadowOffset = offSetShadow
        layer.shadowRadius = radiusShadow
    }
}
