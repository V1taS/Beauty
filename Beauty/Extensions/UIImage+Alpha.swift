//
//  UIImage+Alpha.swift
//  Beauty
//
//  Created by Vitalii Sosin on 04.11.2021.
//

import UIKit

extension UIImage {
    func withAlpha(_ a: CGFloat) -> UIImage {
        return UIGraphicsImageRenderer(size: size, format: imageRendererFormat).image { (_) in
            draw(in: CGRect(origin: .zero, size: size), blendMode: .normal, alpha: a)
        }
    }
}
