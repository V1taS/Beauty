//
//  InvitationPanelView.swift
//  Beauty
//
//  Created by Vitalii Sosin on 04.11.2021.
//  
//

import UIKit

public final class InvitationPanelView: UIView {

    // MARK: - Public variables
    public override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 177)
    }

    // MARK: - Private variables
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let progressBar = UIProgressView()
    private let shareButton = ButtonView()
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
        [titleLabel, descriptionLabel, progressBar, shareButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview($0)
        }
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)

        NSLayoutConstraint.activate([
            progressBar.heightAnchor.constraint(equalToConstant: 16),

            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }

    private func applyDefaultBehavior() {
        backgroundColor = .white
        layer.cornerRadius = 24

        titleLabel.text = "Пригласи 5 друзей и получи 300 бонусов на счёт"
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = .zero

        descriptionLabel.text = "2 друга"
        descriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        descriptionLabel.textColor = UIColor(hex: 0x243656)

        progressBar.tintColor = UIColor(hex: 0x7DC579)
        progressBar.trackTintColor = UIColor(hex: 0xF1F1FA)
        progressBar.progress = 0.2

        shareButton.colorTitle = .white
        shareButton.colorBg = UIColor(hex: 0xC270E0)
        shareButton.title = "Поделиться"

        stack.axis = .vertical
        stack.setCustomSpacing(1, after: titleLabel)
        stack.setCustomSpacing(8, after: descriptionLabel)
        stack.setCustomSpacing(13, after: progressBar)

        // Put
        apply()
    }
}

private enum Constants {
}
