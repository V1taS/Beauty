//
//  ButtonView.swift
//  Beauty
//
//  Created by Vitalii Sosin on 02.11.2021.
//  
//

import UIKit

public final class ButtonView: UIView {

    // MARK: - Public variables
    public var colorBg: UIColor? {
        didSet {
            button.backgroundColor = colorBg
        }
    }

    public var colorTitle: UIColor? {
        didSet {
            button.setTitleColor(colorTitle, for: .normal)
        }
    }

    public var title: String? {
        didSet {
            button.setTitle(title, for: .normal)
        }
    }

    public var action: (() -> Void)?

    public override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 48)
    }

    // MARK: - Private variables
    private let button = UIButton(type: .system)

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
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)

        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func applyDefaultBehavior() {
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(touchButton), for: .touchUpInside)
        apply()
    }

    @objc
    private func touchButton() {
        action?()
    }
}

private enum Constants {
}
