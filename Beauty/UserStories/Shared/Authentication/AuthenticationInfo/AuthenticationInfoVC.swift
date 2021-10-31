//
//  AuthenticationInfoVC.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

final class AuthenticationInfoVC: UIViewController {
    weak var routeDelegate: AuthenticationInfoRouterDelegate?
    var biometricService: BiometricAuthService?

    @BoolDefaults(key: DefaultsWrapper.showBiometricsAuthentication)
    private var showBiometricsConfiguration: Bool

    private let createCodeInfoLabel = UILabel()
    private let doNotShowMessageAgainLabel = UILabel()
    private let doNotShowMessageAgainSwitch = UISwitch()
    private let startActionButton = UIButton()
    private let logoImageView = UIImageView()
    private let buttonStackView = UIStackView()
    private let doNotShowMessageAgainStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        view.backgroundColor = UIColor.white
        title = "Вход"
        configureLayout()
        configureDefaultValues()
    }

    func configureLayout() {
        let subViews = [createCodeInfoLabel,
                        startActionButton,
                        doNotShowMessageAgainSwitch,
                        doNotShowMessageAgainLabel,
                        logoImageView,
                        buttonStackView,
                        doNotShowMessageAgainStackView
                        ]

        subViews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        let addSubViews = [createCodeInfoLabel,
                           startActionButton,
                           logoImageView,
                           buttonStackView
                           ]
        addSubViews.forEach {
            view.addSubview($0)
        }

        NSLayoutConstraint.activate(setConstraints())
    }

    private func configureDefaultValues() {
        //createCodeInfoLabel
        createCodeInfoLabel.text = title()
        createCodeInfoLabel.applyInfoDesign()

        //doNotShowMessageAgainLabel
        doNotShowMessageAgainLabel.text = BiometricsConstants.doNotShowThisMessageText
        doNotShowMessageAgainLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        doNotShowMessageAgainLabel.numberOfLines = 0
        doNotShowMessageAgainLabel.textAlignment = .left
        doNotShowMessageAgainLabel.textColor = UIColor.black

        //startActionButton
//        startActionButton.text = BiometricsConstants.startTitle
//        startActionButton.state = .enabled
//        startActionButton.action = { [weak self] in
//            self?.routeDelegate?.startPasscodeEnter()
//        }

        //logoImageView
//        logoImageView.image = .house
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 500), for: .horizontal)
        logoImageView.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 500), for: .vertical)

        //doNotShowMessageAgainStackView
        doNotShowMessageAgainStackView.axis = .horizontal
        doNotShowMessageAgainStackView.distribution = .fill
        doNotShowMessageAgainStackView.alignment = .center
        doNotShowMessageAgainStackView.spacing = BiometricsConstants.defaultViewPadding
        doNotShowMessageAgainStackView.addArrangedSubview(doNotShowMessageAgainLabel)
        doNotShowMessageAgainStackView.addArrangedSubview(doNotShowMessageAgainSwitch)

        doNotShowMessageAgainSwitch.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .horizontal)
        doNotShowMessageAgainSwitch.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        doNotShowMessageAgainSwitch.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .horizontal)
        doNotShowMessageAgainSwitch.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .vertical)

        //buttonStackView
        buttonStackView.axis = .vertical
        buttonStackView.distribution = .fill

        buttonStackView.spacing = BiometricsConstants.defaultViewPadding
        buttonStackView.addArrangedSubview(doNotShowMessageAgainStackView)
        buttonStackView.addArrangedSubview(startActionButton)

        if #available(iOS 11.0, *) {
            buttonStackView.setCustomSpacing(35, after: doNotShowMessageAgainStackView)
        }

        doNotShowMessageAgainSwitch.setOn(false, animated: false)
        showBiometricsConfiguration = !doNotShowMessageAgainSwitch.isOn
        doNotShowMessageAgainSwitch.addTarget(self, action: #selector(messageSwitchChanged), for: .valueChanged)
    }

    private func setConstraints() -> [NSLayoutConstraint] {
        [
            createCodeInfoLabel.topAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.topAnchor, constant: BiometricsConstants.defaultViewPadding),
            createCodeInfoLabel.leadingAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.leadingAnchor, constant: BiometricsConstants.defaultViewPadding),
            createCodeInfoLabel.trailingAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.trailingAnchor, constant: -BiometricsConstants.defaultViewPadding),
            createCodeInfoLabel.bottomAnchor.constraint(lessThanOrEqualTo: logoImageView.topAnchor),

            startActionButton.heightAnchor.constraint(equalToConstant: BiometricsConstants.buttonHeight),

            buttonStackView.bottomAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.bottomAnchor, constant: -42),
            buttonStackView.leadingAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.leadingAnchor, constant: BiometricsConstants.defaultViewPadding),
            buttonStackView.trailingAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.trailingAnchor, constant: -BiometricsConstants.defaultViewPadding),
            buttonStackView.topAnchor.constraint(greaterThanOrEqualTo: logoImageView.bottomAnchor),

            logoImageView.centerXAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.centerYAnchor, constant: -BiometricsConstants.defaultCenterYPadding),
            logoImageView.heightAnchor.constraint(lessThanOrEqualToConstant: BiometricsConstants.defaultCircleSize),
            logoImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: BiometricsConstants.minCircleSize),
            logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor),
        ]
    }

    @objc
    private func messageSwitchChanged() {
        showBiometricsConfiguration = !doNotShowMessageAgainSwitch.isOn
    }

    private func title() -> String {
        guard let biometricService = self.biometricService else { return BiometricsConstants.createCodeInfoNoBiometry }
        switch biometricService.type {
        case .none:
            return BiometricsConstants.createCodeInfoNoBiometry
        case .faceID:
            return String(format: BiometricsConstants.createCodeInfo, BiometricsConstants.faceIDText)
        case .touchID:
            return String(format: BiometricsConstants.createCodeInfo, BiometricsConstants.touchIDText)
        }
    }
}
