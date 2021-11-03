//
//  KeyboardButtonView.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

public final class KeyboardButtonView: UIView {

    // MARK: - Public variables
    public var text = "" {
        didSet {
            if image == nil {
                label.text = text
            }
        }
    }

    public var image: UIImage? {
        didSet {
            imageView.image = image
            if !text.isEmpty && image != nil {
                label.text = ""
            }
        }
    }

    public var imageOffset: CGPoint = .zero {
        didSet {
            centerXImageConstraint?.constant = imageOffset.x
            centerYImageConstraint?.constant = imageOffset.y
        }
    }

    public var action: ((String) -> Void)?

    // MARK: - Private variables
    private let label = UILabel()
    private let imageView = UIImageView()
    private let backgroundDecorationView = TouchableView()
    private var heightConstraint: NSLayoutConstraint!

    private var centerXImageConstraint: NSLayoutConstraint!
    private var centerYImageConstraint: NSLayoutConstraint!

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

    public override var intrinsicContentSize: CGSize {
        CGSize(width: Constants.defaultButtonSize, height: Constants.defaultButtonSize)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        let backgroundSideSize = min(frame.size.height, frame.size.width)
        backgroundDecorationView.layer.cornerRadius = backgroundSideSize / 2
    }

    // MARK: - Private funcs
    private func apply() {
        // FIXME: - добавить цвет и шрифт
        backgroundDecorationView.deselectionColor = .black
        backgroundDecorationView.selectionColor = .white

        backgroundDecorationView.backgroundColor = .clear
    }

    private func configureLayout() {
        backgroundDecorationView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundDecorationView)

        [label, imageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            backgroundDecorationView.addSubview($0)
        }

        heightConstraint = backgroundDecorationView.heightAnchor.constraint(equalToConstant: 0)

        centerYImageConstraint = imageView.centerYAnchor.constraint(equalTo: backgroundDecorationView.centerYAnchor)
        centerXImageConstraint = imageView.centerXAnchor.constraint(equalTo: backgroundDecorationView.centerXAnchor)

        NSLayoutConstraint.activate([
            backgroundDecorationView.centerYAnchor.constraint(equalTo: centerYAnchor),
            backgroundDecorationView.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundDecorationView.heightAnchor.constraint(equalTo: backgroundDecorationView.widthAnchor),
            backgroundDecorationView.topAnchor.constraint(equalTo: topAnchor),
            backgroundDecorationView.bottomAnchor.constraint(equalTo: bottomAnchor),

            centerYImageConstraint,
            centerXImageConstraint,

            label.leadingAnchor.constraint(equalTo: backgroundDecorationView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: backgroundDecorationView.trailingAnchor),
            label.topAnchor.constraint(equalTo: backgroundDecorationView.topAnchor),
            label.bottomAnchor.constraint(equalTo: backgroundDecorationView.bottomAnchor),
        ])
    }

    private func applyDefaultBehavior() {
        backgroundColor = .clear
        if image == nil {
            label.text = text
        }
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        imageView.image = image
        backgroundDecorationView.action = { [weak self] in
            guard let self = self else { return }
            self.action?(self.text)
        }
    }
}

private enum Constants {
    static let defaultButtonSize: CGFloat = 74
}

