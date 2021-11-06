//
//  InviteDashBoardView.swift
//  Beauty
//
//  Created by Vitalii Sosin on 06.11.2021.
//  
//

import UIKit

public final class InviteDashBoardView: UIView, GenericCellSubview {

    // MARK: - Public variables
    public var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }

    public var titleProgressBarText: String? {
        didSet {
            titleProgressBarLabel.text = titleProgressBarText
        }
    }

    public var descriptionText: String? {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }

    public var progressBarValue: Float? {
        didSet {
            progressBar.progress = progressBarValue ?? .zero
        }
    }

    public var shareButtonAction: (() -> Void)?

    public override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 243)
    }

    // MARK: - Private variables
    private var stack = UIStackView()
    private var titleLabel = UILabel()
    private let titleProgressBarLabel = UILabel()
    private let progressBar = UIProgressView()
    private let shareButton = ButtonView()
    private let descriptionLabel = UILabel()

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
        [titleLabel, titleProgressBarLabel, progressBar, shareButton, descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview($0)
        }
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)

        let constraint = [
            progressBar.heightAnchor.constraint(equalToConstant: 16),
            titleLabel.heightAnchor.constraint(equalToConstant: 44),

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

        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = .zero
        titleLabel.textAlignment = .center

        titleProgressBarLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        titleProgressBarLabel.textColor = UIColor(hex: 0x243656)

        progressBar.tintColor = UIColor(hex: 0x7DC579)
        progressBar.trackTintColor = UIColor(hex: 0xF1F1FA)

        shareButton.colorTitle = .white
        shareButton.colorBg = UIColor(hex: 0xC270E0)
        shareButton.title = "Поделиться"

        descriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        descriptionLabel.textColor = UIColor(hex: 0x243656)
        descriptionLabel.numberOfLines = .zero
        descriptionLabel.textAlignment = .center

        stack.axis = .vertical
        stack.setCustomSpacing(1, after: titleLabel)
        stack.setCustomSpacing(8, after: titleProgressBarLabel)
        stack.setCustomSpacing(16, after: progressBar)
        stack.setCustomSpacing(20, after: shareButton)

        shareButton.action = { [weak self] in
            guard let self = self else { return }
            self.shareButtonAction?()
        }
        apply()
    }
}

private enum Constants {
}
