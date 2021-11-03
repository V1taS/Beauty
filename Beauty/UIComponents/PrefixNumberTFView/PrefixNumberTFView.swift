//
//  PrefixNumberTFView.swift
//  Beauty
//
//  Created by Vitalii Sosin on 03.11.2021.
//  
//

import UIKit

public final class PrefixNumberTFView: UIView {

    // MARK: - Public variables
    public var symbol: String? {
        didSet {
            numberTextLabel.text = symbol
        }
    }

    public override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 22)
    }

    // MARK: - Private variables
    private let container = UIView()
    private let numberTextLabel = UILabel()
    private let icon = UIImageView()

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
        [numberTextLabel, icon].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            container.addSubview($0)
        }
        container.translatesAutoresizingMaskIntoConstraints = false
        addSubview(container)

        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.topAnchor.constraint(equalTo: topAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),

            numberTextLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 24),
            numberTextLabel.topAnchor.constraint(equalTo: container.topAnchor),
            numberTextLabel.trailingAnchor.constraint(equalTo: icon.trailingAnchor, constant: -8),
            numberTextLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor),

            icon.topAnchor.constraint(equalTo: container.topAnchor),
            icon.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            icon.bottomAnchor.constraint(equalTo: container.bottomAnchor),
        ])
    }

    private func applyDefaultBehavior() {
        numberTextLabel.text = "+7"
        numberTextLabel.textColor = UIColor(hex: 0xADB3BC)
        numberTextLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)

        icon.image = UIImage(named: "prefixNumberSeparator")
        apply()
    }
}

private enum Constants {
}
