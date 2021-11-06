//
//  DimmingImageView.swift
//  Beauty
//
//  Created by Vitalii Sosin on 01.11.2021.
//  
//

import UIKit

public final class DimmingImageView: UIView {

    // MARK: - Public variables
    public var image = UIImage() {
        didSet {
            imageView.image = image
        }
    }

    // MARK: - Private variables
    let imageView = UIImageView()
    var gradient: CALayer?

    // MARK: - Public funcs
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        applyDefaultBehavior()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureLayout()
        applyDefaultBehavior()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        if gradient == nil {
            configureGradientLayer()
        }
    }

    // MARK: - Private funcs
    private func apply() {
    }

    private func configureLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func applyDefaultBehavior() {
        imageView.contentMode = .scaleAspectFill
        apply()
    }

    private func configureGradientLayer(){
        backgroundColor = .clear
        let startColor = UIColor.black.withAlphaComponent(0.2)
        let endColor = UIColor.black.withAlphaComponent(0.5)
        let gradient = CAGradientLayer()
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.locations = [0, 1]
        gradient.frame = bounds
        self.gradient = gradient
        layer.addSublayer(gradient)
    }
}

private enum Constants {
}
