//
//  RegistrationVC.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import UIKit

final class RegistrationVC: UIViewController {

    // MARK: - Internal variables
    var interactor: RegistrationInteractor?

    // MARK: - Private variables
    private let stack = UIStackView()
    private let titleLabel = UILabel()
    private let nameTextField = UITextField()
    private let surnameTextField = UITextField()
    // phoneNumberTextField
    private let continueButton = ButtonView()
    private let loginButton = ButtonView()

    private let spacerNameTF = UIView()
    private let spacerSurnameTF = UIView()

    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        applyDefaultBehavior()
    }
    
    // MARK: - Private funcs
    private func configureLayout() {
        [titleLabel, nameTextField, surnameTextField, continueButton, loginButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview($0)
        }

        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)

        NSLayoutConstraint.activate([
            nameTextField.heightAnchor.constraint(equalToConstant: 46),
            surnameTextField.heightAnchor.constraint(equalToConstant: 46),
            spacerNameTF.widthAnchor.constraint(equalToConstant: 16),
            spacerSurnameTF.widthAnchor.constraint(equalToConstant: 16),

            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 33),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
        ])
    }

    private func applyDefaultBehavior() {
        view.backgroundColor = UIColor.Registration.Background.color
        stack.axis = .vertical
        stack.spacing = 17
        stack.setCustomSpacing(49, after: titleLabel)
        stack.setCustomSpacing(35, after: surnameTextField)

        titleLabel.text = String.Registration.Labels.title
        titleLabel.textColor = UIColor.Registration.Labels.title
        titleLabel.font = UIFont.Registration.title
        titleLabel.textAlignment = .center

        nameTextField.placeholder = String.Registration.TextFields.name
        nameTextField.backgroundColor = UIColor.Registration.TextField.background
        nameTextField.layer.cornerRadius = 23
        nameTextField.leftView = spacerNameTF
        nameTextField.leftViewMode = .always

        surnameTextField.placeholder = String.Registration.TextFields.surname
        surnameTextField.backgroundColor = UIColor.Registration.TextField.background
        surnameTextField.layer.cornerRadius = 23
        surnameTextField.leftView = spacerSurnameTF
        surnameTextField.leftViewMode = .always

        continueButton.title = String.Registration.Button.continueButton
        continueButton.colorBg = UIColor.Registration.Button.continueButtonButtonBg
        continueButton.colorTitle = UIColor.Registration.Button.continueButtonTitle
        continueButton.action = { [weak self] in
            self?.interactor?.confirmCode()
        }

        loginButton.title = String.Registration.Button.loginButton
        loginButton.colorBg = UIColor.Registration.Button.loginButtonBg
        loginButton.colorTitle = UIColor.Registration.Button.loginButtonTitle
        loginButton.borderColor = UIColor.Registration.Button.loginButtonBorder
        loginButton.action = { [weak self] in
            self?.interactor?.login()
        }
    }
}

extension RegistrationVC: RegistrationView {
}

private enum Constants {
}
