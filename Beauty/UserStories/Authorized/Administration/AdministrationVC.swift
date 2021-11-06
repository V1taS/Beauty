//
//  AdministrationVC.swift
//  Beauty
//
//  Created by Vitalii Sosin on 06.11.2021.
//  
//

import UIKit

final class AdministrationVC: UIViewController {

    // MARK: - Internal variables
    var interactor: AdministrationInteractor?

    // MARK: - Private variables
    private let stack = UIStackView()
    private let titleLabel = UILabel()
    private let phoneNumberField = InputView()
    private let continueButton = ButtonView()
    private let prefixNumberTFView = PrefixNumberTFView()

    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        applyDefaultBehavior()
    }

    // MARK: - Private func
    private func configureLayout() {
        [titleLabel, phoneNumberField, continueButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview($0)
        }

        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)

        NSLayoutConstraint.activate([
            phoneNumberField.heightAnchor.constraint(equalToConstant: 46),

            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 33),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
        ])
    }

    private func applyDefaultBehavior() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = UIColor.MainScreen.Background.color

        stack.axis = .vertical
        stack.spacing = 17
        stack.setCustomSpacing(49, after: titleLabel)
        stack.setCustomSpacing(35, after: phoneNumberField)

        titleLabel.text = "Списание баллов"
        titleLabel.textColor = UIColor.Login.Labels.title
        titleLabel.font = UIFont.Login.title
        titleLabel.textAlignment = .center

        phoneNumberField.placeholder = String.Login.TextFields.phone
        phoneNumberField.backgroundColor = UIColor.Login.TextField.background
        phoneNumberField.layer.cornerRadius = 23
        phoneNumberField.leftView = prefixNumberTFView
        phoneNumberField.behavior = InputView.PhoneBehavoiur(mask: "(###) ###-##-##")

        continueButton.title = String.Login.Button.continueButton
        continueButton.colorBg = UIColor.Login.Button.continueButtonButtonBg
        continueButton.colorTitle = UIColor.Login.Button.continueButtonTitle

        interactor?.loadedView()
    }
}

extension AdministrationVC: AdministrationView {
}

private enum Constants {
}
