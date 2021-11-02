//
//  HomeScreenVC.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import UIKit

final class HomeScreenVC: UIViewController {

    // MARK: - Internal variables
    var interactor: HomeScreenInteractor?

    // MARK: - Private variables
    private let bgImageView = UIImageView()
    private let stack = UIStackView()

    private let spacerTop = UIView()
    private let spacerBottom = UIView()
    private let loginButton = ButtonView()
    private let registrationButton = ButtonView()
    private let firstSocialNetworkLabel = UILabel()
    private let secondSocialNetworkLabel = UILabel()

    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        applyDefaultBehavior()
    }

    // MARK: - Private funcs
    private func configureLayout() {
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bgImageView)

        [spacerTop, loginButton, registrationButton, firstSocialNetworkLabel, secondSocialNetworkLabel, spacerBottom].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview($0)
        }

        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)

        NSLayoutConstraint.activate([
            spacerTop.heightAnchor.constraint(equalToConstant: 66),
            spacerBottom.heightAnchor.constraint(equalToConstant: 40),

            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),

            registrationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            registrationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),

            bgImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bgImageView.topAnchor.constraint(equalTo: view.topAnchor),
            bgImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bgImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
    }

    private func applyDefaultBehavior() {
        view.backgroundColor = .white
        bgImageView.image = UIImage.HomeScreen.Background.image
        bgImageView.contentMode = .scaleAspectFill

        stack.axis = .vertical
        stack.alignment = .center
        stack.setCustomSpacing(20, after: loginButton)
        stack.setCustomSpacing(56, after: registrationButton)
        stack.setCustomSpacing(8, after: firstSocialNetworkLabel)
        stack.backgroundColor = UIColor.HomeScreen.Stack.bg
        stack.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        stack.clipsToBounds = true
        stack.layer.cornerRadius = 30
        stack.applyBigShadow()

        loginButton.colorTitle = UIColor.HomeScreen.Button.loginButtonTitle
        loginButton.colorBg = UIColor.HomeScreen.Button.loginButtonBg
        loginButton.title = String.HomeScreen.Button.loginButton
        loginButton.action = { [weak self] in
            self?.interactor?.login(username: "", password: "")
        }

        registrationButton.colorTitle = UIColor.HomeScreen.Button.registrationButtonTitle
        registrationButton.colorBg = UIColor.HomeScreen.Button.registrationButtonBg
        registrationButton.title = String.HomeScreen.Button.registrationButton
        registrationButton.action = { [weak self] in
            self?.interactor?.registration(username: "", password: "")
        }

        firstSocialNetworkLabel.text = String.HomeScreen.SocialNetworkLabels.first
        firstSocialNetworkLabel.textColor = UIColor.HomeScreen.SocialNetworkLabels.first
        firstSocialNetworkLabel.font = UIFont.HomeScreen.SocialNetworkLabels.first

        secondSocialNetworkLabel.text = String.HomeScreen.SocialNetworkLabels.second
        secondSocialNetworkLabel.textColor = UIColor.HomeScreen.SocialNetworkLabels.second
        secondSocialNetworkLabel.font = UIFont.HomeScreen.SocialNetworkLabels.second

        interactor?.loadedView()
    }
}

extension HomeScreenVC: HomeScreenView {
}

private enum Constants {
}
