//
//  UseBiometricsVC.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit
import LocalAuthentication

final class UseBiometricsVC: UIViewController {

    weak var router: UseBiometricsDelegate?
    var biometricService: BiometricAuthService?

    private let useFaceIDInfoLabel = UILabel()
    private let logoImageView = UIImageView()
    private let addFaceIDActionButton = UIButton()
    private let skipActionButton = UIButton()
    private let buttonStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        view.backgroundColor = UIColor.white
        configureLayout()
        configureDefaultValues()
    }

    func configureLayout() {
        let subViews = [addFaceIDActionButton,
                        skipActionButton,
                        buttonStackView,
                        logoImageView,
                        useFaceIDInfoLabel
                        ]

        subViews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        let addSubViews = [buttonStackView,
                           logoImageView,
                           useFaceIDInfoLabel
                           ]
        addSubViews.forEach {
            view.addSubview($0)
        }

        NSLayoutConstraint.activate(setConstraints())
    }

    func configureDefaultValues() {

        title = navigationBarTitle()

        //createCodeInfoLabel
        useFaceIDInfoLabel.text = title()
        useFaceIDInfoLabel.applyInfoDesign()

        // FIXME: - настроить кнопку
        //addTouchIDActionButton
//        addFaceIDActionButton.text = buttonText()
//        addFaceIDActionButton.state = .enabled
//        addFaceIDActionButton.action = { [unowned self] in
//
//            self.biometricService?.authorize { [unowned self] result in
//
//                switch result {
//                case .success:
//                    self.router?.biometricsFinished()
//                case .failure(let error):
//                    let alert = UIAlertController.alertWithOneButton(title: error.localizedDescription, action: {
//                        if let type = self.biometricService?.type, type == .none {
//                            self.router?.biometricsFinished()
//                            self.biometricService?.invalidate()
//                        }
//                    })
//                    self.present(alert, animated: true, completion: nil)
//                }
//            }
//
//        }

        //skipActionButton
//        skipActionButton.text = BiometricsConstants.skipText
//        skipActionButton.state = .enabled
//        skipActionButton.design = Button.PlainDesign()
//        skipActionButton.action = { [unowned self] in
//            self.router?.biometricsFinished()
//        }

        logoImageView.image = image()
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 500), for: .horizontal)
        logoImageView.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 500), for: .vertical)

        //buttonStackView
        buttonStackView.axis = .vertical
        buttonStackView.distribution = .fill
        buttonStackView.spacing = BiometricsConstants.defaultViewPadding
        [addFaceIDActionButton, skipActionButton].forEach { buttonStackView.addArrangedSubview($0) }
    }

    func setConstraints() -> [NSLayoutConstraint] {
        [
            useFaceIDInfoLabel.topAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.topAnchor, constant: BiometricsConstants.defaultViewPadding),
            useFaceIDInfoLabel.leadingAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.leadingAnchor, constant: BiometricsConstants.defaultViewPadding),
            useFaceIDInfoLabel.trailingAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.trailingAnchor, constant: -BiometricsConstants.defaultViewPadding),
            useFaceIDInfoLabel.bottomAnchor.constraint(lessThanOrEqualTo: logoImageView.topAnchor),

            addFaceIDActionButton.heightAnchor.constraint(equalToConstant: BiometricsConstants.buttonHeight),
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
    }

    private func navigationBarTitle() -> String {
        guard let biometricService = biometricService else { return "" }
        switch biometricService.type {
        case .none:
            return ""
        case .faceID:
            return BiometricsConstants.faceIDText
        case .touchID:
            return BiometricsConstants.touchIDText
        }
    }

    private func title() -> String {
        guard let biometricService = biometricService else { return "" }
        switch biometricService.type {
        case .none:
            return ""
        case .faceID:
            return String(format: BiometricsConstants.biometricsUseTitle, BiometricsConstants.faceIDText)
        case .touchID:
            return String(format: BiometricsConstants.biometricsUseTitle, BiometricsConstants.touchIDText)
        }
    }

    private func image() -> UIImage {
        guard let biometricService = biometricService else { return UIImage() }
        switch biometricService.type {
        case .none:
            return UIImage()
        case .faceID:
            // FIXME: - добавить иконку
            return .add
        case .touchID:
            // FIXME: - добавить иконку
            return .add
        }
    }

    private func buttonText() -> String {
        guard let biometricService = biometricService else { return "" }
        switch biometricService.type {
        case .none:
            return ""
        case .faceID:
            return String(format: BiometricsConstants.addBiometryText, BiometricsConstants.faceIDText)
        case .touchID:
            return String(format: BiometricsConstants.addBiometryText, BiometricsConstants.touchIDText)
        }
    }
}

