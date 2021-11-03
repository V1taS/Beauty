//
//  SMSInputVC.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import UIKit

final class SMSInputVC: UIViewController {

    // MARK: - Internal variables
    var interactor: SMSInputInteractor?

    // MARK: - Private variables
    private let stack = UIStackView()
    private let titleLabel = UILabel()
    private let smsNumberField = PasscodeInputView()
    private let numberKeyboardView = NumberKeyboardView()

    private let continueButton = ButtonView()
    private let spacerphoneNumberTF = UIView()

    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        applyDefaultBehavior()
    }

    private func configureLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        smsNumberField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(smsNumberField)

        [numberKeyboardView, continueButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview($0)
        }

        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)

        NSLayoutConstraint.activate([
            smsNumberField.heightAnchor.constraint(equalToConstant: 46),
            spacerphoneNumberTF.widthAnchor.constraint(equalToConstant: 16),

            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 33),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),

            smsNumberField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            smsNumberField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 49),

            stack.topAnchor.constraint(equalTo: smsNumberField.bottomAnchor, constant: 35),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            stack.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor)
        ])
    }

    private func applyDefaultBehavior() {
        view.backgroundColor = UIColor.SMSInput.Background.color

        stack.axis = .vertical
        stack.spacing = 17

        titleLabel.text = String.SMSInput.Labels.title
        titleLabel.textColor = UIColor.SMSInput.Labels.title
        titleLabel.font = UIFont.SMSInput.title
        titleLabel.textAlignment = .center

        numberKeyboardView.action = { [weak self] inputValue in
            guard let self = self else { return }

            if self.smsNumberField.passcode.count < 6 {
                self.smsNumberField.passcode = self.smsNumberField.passcode + inputValue
            }
        }

        numberKeyboardView.bottomRightButtonAction = { [weak self] in
            guard let self = self else { return }
            if !self.smsNumberField.passcode.isEmpty {
                self.smsNumberField.passcode.removeLast()
            }
        }

        continueButton.title = String.Login.Button.continueButton
        continueButton.colorBg = UIColor.Login.Button.continueButtonButtonBg
        continueButton.colorTitle = UIColor.Login.Button.continueButtonTitle
        continueButton.action = { [weak self] in
            self?.interactor?.loadedView()
        }
    }
}

extension SMSInputVC: SMSInputView {
}

private enum Constants {
}
