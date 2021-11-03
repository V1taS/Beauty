//
//  SupportVC.swift
//  Beauty
//
//  Created by Vitalii Sosin on 04.11.2021.
//  
//

import UIKit

final class SupportVC: UIViewController {

    // MARK: - Internal variables
    var interactor: SupportInteractor?

    // MARK: - Private variables
    private let backgroundImageView = DimmingImageView()
    private let container = UIView()
    private let mainStack = UIStackView()

    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()

    private let workingHoursView = ImageWithLabelView()
    private let callButton = ButtonView()
    private let divider = UIView()
    private let aboutUsTitleLabel = UILabel()
    private let aboutUsDescriptionLabel = UILabel()
    private let sendMessageTF = InputView()
    private let sendMessageTFSpacer = UIView()
    private let sendMessageButton = ButtonView()

    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        applyDefaultBehavior()
    }

    // MARK: - Private func
    private func configureLayout() {
        [titleLabel, descriptionLabel, workingHoursView, callButton, divider, aboutUsTitleLabel, aboutUsDescriptionLabel, sendMessageTF, sendMessageButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            mainStack.addArrangedSubview($0)
        }
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(mainStack)
        [backgroundImageView, container].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        NSLayoutConstraint.activate([
            divider.heightAnchor.constraint(equalToConstant: 1),
            sendMessageTF.heightAnchor.constraint(equalToConstant: 46),
            sendMessageTFSpacer.widthAnchor.constraint(equalToConstant: 24),

            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.topAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.topAnchor, constant: 170),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            mainStack.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            mainStack.topAnchor.constraint(equalTo: container.topAnchor, constant: 24),
            mainStack.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            mainStack.bottomAnchor.constraint(lessThanOrEqualTo: container.bottomAnchor)
        ])

    }

    private func applyDefaultBehavior() {
        view.backgroundColor = .white
        backgroundImageView.image = UIImage.OnBoarding.Background.first

        mainStack.axis = .vertical
        mainStack.setCustomSpacing(4, after: titleLabel)
        mainStack.setCustomSpacing(11, after: descriptionLabel)
        mainStack.setCustomSpacing(11, after: workingHoursView)
        mainStack.setCustomSpacing(12, after: callButton)
        mainStack.setCustomSpacing(22, after: divider)
        mainStack.setCustomSpacing(10, after: aboutUsTitleLabel)
        mainStack.setCustomSpacing(32, after: aboutUsDescriptionLabel)
        mainStack.setCustomSpacing(16, after: sendMessageTF)

        container.backgroundColor = UIColor.MainScreen.Background.color
        container.layer.cornerRadius = 24
        container.clipsToBounds = true

        titleLabel.text = "Beauty PRO"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)

        descriptionLabel.text = "Иваново, ул. Марии Рябининой, 5"
        descriptionLabel.textColor = UIColor(hex: 0x50555C)
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)

        callButton.title = "Позвонить"
        callButton.colorTitle = .white
        callButton.colorBg = UIColor(hex: 0xC270E0)

        divider.backgroundColor = UIColor(hex: 0xC4C4C4)

        aboutUsTitleLabel.text = "О нас"
        aboutUsTitleLabel.textColor = .black
        aboutUsTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        aboutUsDescriptionLabel.text = "Living up to our name Plush Beauty Lounge, the team is highly energetic and creative. We believe that if it matters to you, it matters to us. "
        aboutUsDescriptionLabel.textColor = .black
        aboutUsDescriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        aboutUsDescriptionLabel.numberOfLines = .zero

        sendMessageTF.placeholder = "Введите сообщение"
        sendMessageTF.backgroundColor = .white
        sendMessageTF.leftView = sendMessageTFSpacer
        sendMessageTF.layer.cornerRadius = 23

        sendMessageButton.title = "Отправить"
        sendMessageButton.colorTitle = .white
        sendMessageButton.colorBg = UIColor(hex: 0xC270E0)

        interactor?.loadedView()
    }
}

extension SupportVC: SupportView {
}

private enum Constants {
}
