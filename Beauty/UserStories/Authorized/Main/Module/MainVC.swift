//
//  MainVC.swift
//  Beauty
//
//  Created by Vitalii Sosin on 30.10.2021.
//  
//

import UIKit

final class MainVC: UIViewController {

    // MARK: - Internal variables
    var interactor: MainInteractor?

    // MARK: - Private variables
    private let headerMainScreenView = HeaderMainScreenView()
    private let stack = UIStackView()
    private let invitationPanelView = InvitationPanelView()
    private let descriptionLabel = UILabel()

    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        applyDefaultBehavior()
    }

    // MARK: - Private func
    private func configureLayout() {
        [invitationPanelView, descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview($0)
        }

        [headerMainScreenView, stack].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            headerMainScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerMainScreenView.topAnchor.constraint(equalTo: view.topAnchor),
            headerMainScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.topAnchor.constraint(equalTo: headerMainScreenView.bottomAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stack.bottomAnchor.constraint(lessThanOrEqualTo: view.compatableSafeAreaLayoutGuide.bottomAnchor),
        ])
    }

    private func applyDefaultBehavior() {
        view.backgroundColor = UIColor.MainScreen.Background.color
        stack.backgroundColor = .clear
        stack.axis = .vertical
        stack.setCustomSpacing(18, after: invitationPanelView)

        descriptionLabel.text = String.MainScreen.Labels.descriptionTwo
        descriptionLabel.textColor = UIColor(hex: 0x243656)
        descriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        descriptionLabel.numberOfLines = .zero

        interactor?.loadedView()
    }
}

extension MainVC: MainView {
}

private enum Constants {
}
