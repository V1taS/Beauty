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
    private let smsNumberField = UITextField()

    private let continueButton = ButtonView()
    private let spacerphoneNumberTF = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        applyDefaultBehavior()
    }

    private func configureLayout() {
        [titleLabel, smsNumberField, continueButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview($0)
        }

        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)

        NSLayoutConstraint.activate([
            smsNumberField.heightAnchor.constraint(equalToConstant: 46),
            spacerphoneNumberTF.widthAnchor.constraint(equalToConstant: 16),

            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 33),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
        ])
    }

    private func applyDefaultBehavior() {
        view.backgroundColor = UIColor.SMSInput.Background.color

        stack.axis = .vertical
        stack.spacing = 17
        stack.setCustomSpacing(49, after: titleLabel)
        stack.setCustomSpacing(35, after: smsNumberField)

        titleLabel.text = String.SMSInput.Labels.title
        titleLabel.textColor = UIColor.SMSInput.Labels.title
        titleLabel.font = UIFont.SMSInput.title
        titleLabel.textAlignment = .center

        smsNumberField.placeholder = String.SMSInput.TextFields.phone
        smsNumberField.backgroundColor = UIColor.SMSInput.TextField.background
        smsNumberField.layer.cornerRadius = 23
        smsNumberField.leftView = spacerphoneNumberTF
        smsNumberField.leftViewMode = .always

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
