//
//  ImageWithLabelView.swift
//  Beauty
//
//  Created by Vitalii Sosin on 04.11.2021.
//  
//

import UIKit

public final class ImageWithLabelView: UIView {

    // MARK: - Public variables

    // MARK: - Private variables
    private let textLabel = UILabel()
    private let imageView = UIImageView()
    private let stack = UIStackView()

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

    // MARK: - Private funcs
    private func apply() {
    }

    private func configureLayout() {
        [imageView, textLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview($0)
        }
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)

        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func applyDefaultBehavior() {
        stack.axis = .horizontal
        stack.spacing = 8

        textLabel.text = "Вт-Вс с 10:00 до 20:00"
        textLabel.textColor = .black
        textLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)

        imageView.image = UIImage(named: "workingHours")
        apply()
    }
}

private enum Constants {
}
