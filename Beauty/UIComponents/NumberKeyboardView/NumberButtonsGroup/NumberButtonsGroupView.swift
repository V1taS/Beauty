//
//  NumberButtonsGroupView.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

public protocol KeybordButtonsTitles {
    var text: String { get }
    var image: UIImage? { set get }
}

extension String: KeybordButtonsTitles {
    public var image: UIImage? {
        get {
            return nil
        }
        set {

        }
    }

    public var text: String {
        self
    }
}

public class DefaultKeyboardButtonsTitle: KeybordButtonsTitles {
    public var text: String
    public var image: UIImage?

    init(text: String, image: UIImage?) {
        self.text = text
        self.image = image
    }
}

public final class NumberButtonsGroupView: UIView {

    // MARK: - Public variables
    public var titles = [KeybordButtonsTitles]() {
        didSet {
            applyTitles()
        }
    }

    public var action: ((String) -> Void)?

    public var firstButtonVisible = true {
        didSet {
            firstButton.alpha = firstButtonVisible ? 1 : 0
        }
    }

    // MARK: - Private variables

    private let stackView = UIStackView()
    private let firstButton = KeyboardButtonView()
    private let secondButton = KeyboardButtonView()
    private let thirdButton = KeyboardButtonView()

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
        backgroundColor = .clear

        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)

        [firstButton, secondButton, thirdButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview($0)
        }

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func applyDefaultBehavior() {
        applyTitles()

        stackView.distribution = .fillEqually
        stackView.alignment = .center
        firstButton.alpha = firstButtonVisible ? 1 : 0

        firstButton.action = { [weak self] text in
            self?.action?(text)
        }
        secondButton.action = { [weak self] text in
            self?.action?(text)
        }
        thirdButton.action = { [weak self] text in
            self?.action?(text)
        }
    }

    private func applyTitles() {
        for (index, text) in titles.enumerated() {
            let view = [firstButton, secondButton, thirdButton][index]
            view.text = text.text
            view.image = text.image
        }
    }
}

private enum Constants {
}

