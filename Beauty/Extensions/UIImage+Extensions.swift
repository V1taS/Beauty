//
//  UIImage+Extensions.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

extension UIImage {

    public func tinted(with color: UIColor) -> UIImage? {
        let image = UIImage.draw(size: size, scale: scale) { context in
            guard let cgImage = cgImage else {
                return
            }

            let rect = CGRect(origin: .zero, size: size)

            context.translateBy(x: 0, y: size.height)
            context.scaleBy(x: 1, y: -1)
            context.setBlendMode(.normal)
            context.setFillColor(color.cgColor)
            context.fill(rect)
            context.setBlendMode(.destinationIn)
            context.draw(cgImage, in: rect)
        }

        return image?.withRenderingMode(.alwaysOriginal)
    }

    private static func draw(size: CGSize, scale: CGFloat = UIScreen.main.scale, opaque: Bool = false, closure: (CGContext) -> Void) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, opaque, scale)

        defer {
            UIGraphicsEndImageContext()
        }

        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }

        closure(context)

        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }

        return image
    }
}

