//
//  LoginVC.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import UIKit

final class LoginVC: UIViewController {

    // MARK: - Internal variables
    var interactor: LoginInteractor?

    // MARK: - Private variables
    private let stack = UIStackView()
    private let titleLabel = UILabel()
    private let phoneNumberField = UITextField()

    private let continueButton = ButtonView()
    private let registrationButton = ButtonView()

    private let spacerphoneNumberTF = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        applyDefaultBehavior()
    }

    private func configureLayout() {
        [titleLabel, phoneNumberField, continueButton, registrationButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview($0)
        }

        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)

        NSLayoutConstraint.activate([
            phoneNumberField.heightAnchor.constraint(equalToConstant: 46),
            spacerphoneNumberTF.widthAnchor.constraint(equalToConstant: 16),

            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 33),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
        ])
    }

    private func applyDefaultBehavior() {
        view.backgroundColor = UIColor.Login.Background.color

        stack.axis = .vertical
        stack.spacing = 17
        stack.setCustomSpacing(49, after: titleLabel)
        stack.setCustomSpacing(35, after: phoneNumberField)

        titleLabel.text = String.Login.Labels.title
        titleLabel.textColor = UIColor.Login.Labels.title
        titleLabel.font = UIFont.Login.title
        titleLabel.textAlignment = .center

        phoneNumberField.placeholder = String.Login.TextFields.phone
        phoneNumberField.backgroundColor = UIColor.Login.TextField.background
        phoneNumberField.layer.cornerRadius = 23
        phoneNumberField.leftView = spacerphoneNumberTF
        phoneNumberField.leftViewMode = .always

        continueButton.title = String.Login.Button.continueButton
        continueButton.colorBg = UIColor.Login.Button.continueButtonButtonBg
        continueButton.colorTitle = UIColor.Login.Button.continueButtonTitle
        continueButton.action = { [weak self] in
            self?.interactor?.confirmCode()
        }

        registrationButton.title = String.Login.Button.registrationButton
        registrationButton.colorBg = UIColor.Login.Button.registrationButtonBg
        registrationButton.colorTitle = UIColor.Login.Button.registrationButtonTitle
        registrationButton.borderColor = UIColor.Login.Button.registrationButtonBorder
        registrationButton.action = { [weak self] in
            self?.interactor?.registration()
        }
        interactor?.loadedView()
    }

}

extension LoginVC: LoginView {
    func update() {

    }
}

private enum Constants {
}
