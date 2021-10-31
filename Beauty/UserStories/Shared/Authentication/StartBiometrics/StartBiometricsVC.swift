//
//  StartBiometricsVC.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

final class StartBiometricsVC: UIViewController {

    weak var routeDelegate: StartBiometricsDelegate?
    var biometricService: BiometricAuthService?

    private let addTouchIDActionButton = UIButton()
    private let skipActionButton = UIButton()
    private let buttonStackView = UIStackView()
    private let logoImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        view.backgroundColor = UIColor.white
        configureLayout()
        configureDefaultValues()
    }

    func configureLayout() {
        let subViews = [addTouchIDActionButton,
                        skipActionButton,
                        buttonStackView,
                        logoImageView,
                        logoImageView
                        ]

        subViews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        let addSubViews = [buttonStackView,
                           logoImageView,
                           logoImageView
                           ]
        addSubViews.forEach {
            view.addSubview($0)
        }

        let constraints = setConstraints()
        NSLayoutConstraint.activate(constraints)
    }

    func configureDefaultValues() {

        title = BiometricsConstants.touchIDText

        //addTouchIDActionButton
//        addTouchIDActionButton.text = BiometricsConstants.addBiometryText
//        addTouchIDActionButton.state = .enabled
//        addTouchIDActionButton.action = { [weak self] in
//            self?.routeDelegate?.addBiometrics()
//        }

        //skipActionButton
//        skipActionButton.text = BiometricsConstants.skipText
//        skipActionButton.state = .enabled
//        skipActionButton.design = Button.PlainDesign()
//        skipActionButton.action = { [weak self] in
//            self?.routeDelegate?.skipTapped()
//        }

//        logoImageView.image = .okSign
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 500), for: .horizontal)
        logoImageView.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 500), for: .vertical)

        //buttonStackView
        buttonStackView.axis = .vertical
        buttonStackView.distribution = .fill
        buttonStackView.spacing = BiometricsConstants.defaultViewPadding
        buttonStackView.addArrangedSubview(addTouchIDActionButton)
        buttonStackView.addArrangedSubview(skipActionButton)
    }

    func setConstraints() -> [NSLayoutConstraint] {

        let constraints = [

            addTouchIDActionButton.heightAnchor.constraint(equalToConstant: BiometricsConstants.buttonHeight),
            skipActionButton.heightAnchor.constraint(equalToConstant: BiometricsConstants.buttonHeight),

            buttonStackView.bottomAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.bottomAnchor, constant: -BiometricsConstants.defaultViewPadding),
            buttonStackView.leadingAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.leadingAnchor, constant: BiometricsConstants.defaultViewPadding),
            buttonStackView.trailingAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.trailingAnchor, constant: -BiometricsConstants.defaultViewPadding),
            buttonStackView.topAnchor.constraint(greaterThanOrEqualTo: logoImageView.bottomAnchor),

            logoImageView.centerXAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.centerYAnchor, constant: -50),
            logoImageView.heightAnchor.constraint(lessThanOrEqualToConstant: BiometricsConstants.defaultCircleSize),
            logoImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: BiometricsConstants.minCircleSize),
            logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor),
        ]

        return constraints
    }
}
