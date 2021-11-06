//
//  BannerView.swift
//  Beauty
//
//  Created by Vitalii Sosin on 06.11.2021.
//  
//

import UIKit

public final class BannerView: UIView, GenericCellSubview {

    // MARK: - Public variables
    public var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }

    public var descriptionText: String? {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }

    public override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 98)
    }

    // MARK: - Private variables
    private var stack = UIStackView()
    private var titleLabel = UILabel()
    private var descriptionLabel = UILabel()

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
        [titleLabel, descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview($0)
        }
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)

        let constraint = [
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ]

        constraint.forEach {
            $0.priority = .defaultHigh
        }
        NSLayoutConstraint.activate(constraint)
    }

    private func applyDefaultBehavior() {
        backgroundColor = .white
        layer.cornerRadius = 24
        clipsToBounds = true
        
        stack.spacing = 8
        stack.axis = .vertical

        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center

        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        descriptionLabel.textColor = .black
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = .zero

        apply()
    }
}

private enum Constants {
}
