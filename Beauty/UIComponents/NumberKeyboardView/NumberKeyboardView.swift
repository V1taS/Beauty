//
//  NumberKeyboardView.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

public final class NumberKeyboardView: UIView {

    // MARK: - Public variables
    public var leftButtonVisible = false {
        didSet {
            fourthPasscodeGroup.firstButtonVisible = leftButtonVisible
        }
    }

    public var leftButtonImage: UIImage? {
        didSet {
            fourthTitles[0].image = leftButtonImage
            fourthPasscodeGroup.titles = fourthTitles
        }
    }

    public var action: ((String) -> Void)?
    public var bottomRightButtonAction: (() -> Void)?
    public var bottomLeftButtonAction: (() -> Void)?

    // MARK: - Private variables

    private let stackView = UIStackView()
    private let firstPasscodeGroup = NumberButtonsGroupView()
    private let secondPasscodeGroup = NumberButtonsGroupView()
    private let thirdPasscodeGroup = NumberButtonsGroupView()
    private let fourthPasscodeGroup = NumberButtonsGroupView()

    // FIXME: - добавить иконку
    private lazy var fourthTitles: [KeybordButtonsTitles] = [DefaultKeyboardButtonsTitle(text: "biometry", image: leftButtonImage), "0", DefaultKeyboardButtonsTitle(text: "erase", image: UIImage.add.tinted(with: UIColor.black))]

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

        [stackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        [firstPasscodeGroup, secondPasscodeGroup, thirdPasscodeGroup, fourthPasscodeGroup].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview($0)
        }

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),

            secondPasscodeGroup.heightAnchor.constraint(equalTo: firstPasscodeGroup.heightAnchor),
            thirdPasscodeGroup.heightAnchor.constraint(equalTo: firstPasscodeGroup.heightAnchor),
            fourthPasscodeGroup.heightAnchor.constraint(equalTo: firstPasscodeGroup.heightAnchor)
        ])
    }

    private func applyDefaultBehavior() {
        backgroundColor = .clear
        firstPasscodeGroup.titles = ["1", "2", "3"]
        secondPasscodeGroup.titles = ["4", "5", "6"]
        thirdPasscodeGroup.titles = ["7", "8", "9"]
        fourthPasscodeGroup.titles = fourthTitles
        fourthPasscodeGroup.firstButtonVisible = leftButtonVisible
        fourthTitles[.zero].image = leftButtonImage
        fourthPasscodeGroup.titles = fourthTitles
        stackView.axis = .vertical
        firstPasscodeGroup.action = { [weak self] text in
            self?.action?(text)
        }
        secondPasscodeGroup.action = { [weak self] text in
            self?.action?(text)
        }
        thirdPasscodeGroup.action = { [weak self] text in
            self?.action?(text)
        }
        fourthPasscodeGroup.action = { [weak self] text in
            guard let self = self else { return }
            if text == "biometry" {
                if self.leftButtonVisible {
                    self.bottomLeftButtonAction?()
                }
            }
            else if text == "erase" {
                self.bottomRightButtonAction?()
            }
            else {
                self.action?(text)
            }
        }
    }

    @objc
    private func rightButtonTapped() {
        bottomRightButtonAction?()
    }

    @objc
    private func leftButtonTapped() {
        if leftButtonVisible {
            bottomLeftButtonAction?()
        }
    }
}

private enum Constants {
    static let leftButtonHeight: CGFloat = 44
}

