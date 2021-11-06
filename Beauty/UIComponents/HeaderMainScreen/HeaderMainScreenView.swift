//
//  HeaderMainScreenView.swift
//  Beauty
//
//  Created by Vitalii Sosin on 04.11.2021.
//  
//

import UIKit

public final class HeaderMainScreenView: UIView, GenericCellSubview {

    // MARK: - Public variables
    public var name: String? {
        didSet {
            nameLabel.text = name
        }
    }

    public var scores: String? {
        didSet {
            scoresLabel.text = scores
        }
    }

    public var descriptionText: String? {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }

    public var exitButtonAction: (() -> Void)?

    public override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 220)
    }

    // MARK: - Private variables
    private let backgroundImageView = UIImageView()
    private let exitButton = UIButton(type: .system)
    private let nameLabel = UILabel()
    private let scoresLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let stack = UIStackView()
    private let horizontalStack = UIStackView()
    private let spacing = UIView()

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
        [nameLabel, spacing, exitButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            horizontalStack.addArrangedSubview($0)
        }

        [horizontalStack, scoresLabel, descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview($0)
        }

        [backgroundImageView, stack].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        let constraint = [
            exitButton.widthAnchor.constraint(equalToConstant: 40),
            exitButton.heightAnchor.constraint(equalToConstant: 40),

            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26),
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 75),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28)
        ]

        constraint.forEach {
            $0.priority = .defaultHigh
        }
        NSLayoutConstraint.activate(constraint)
    }

    private func applyDefaultBehavior() {
        backgroundColor = UIColor(hex: 0xC270E0)
        layer.cornerRadius = 24
        clipsToBounds = true

        backgroundImageView.image = UIImage.MainScreen.Background.image.withAlpha(0.1)
        exitButton.setImage(UIImage.MainScreen.Button.exit.tinted(with: .white), for: .normal)

        nameLabel.text = String.MainScreen.Labels.name
        nameLabel.textColor = UIColor.MainScreen.Labels.name
        nameLabel.font = UIFont.MainScreen.name

        scoresLabel.text = String.MainScreen.Labels.scores
        scoresLabel.textColor = UIColor.MainScreen.Labels.scores
        scoresLabel.font = UIFont.MainScreen.scores

        descriptionLabel.text = String.MainScreen.Labels.description
        descriptionLabel.textColor = UIColor.MainScreen.Labels.description
        descriptionLabel.font = UIFont.MainScreen.description

        stack.axis = .vertical
        stack.backgroundColor = .clear
        stack.setCustomSpacing(22, after: exitButton)
        stack.setCustomSpacing(1, after: nameLabel)
        stack.setCustomSpacing(1, after: scoresLabel)

        horizontalStack.axis = .horizontal
        horizontalStack.backgroundColor = .clear

        exitButton.addTarget(self, action: #selector(exitButtonTap), for: .touchUpInside)
        apply()
    }

    @objc
    private func exitButtonTap() {
        exitButtonAction?()
    }
}

private enum Constants {
}
