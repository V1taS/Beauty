//
//  PasscodeVC.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

enum PasscodeState {
    case createPassword
    case enterPassword
}

final class PasscodeVC: UIViewController {

    var interactor: PasscodeInteractor?
    var router: PasscodeRouter?

    var state: PasscodeState = .createPassword

    private var currentPasscode = ""
    @KeychainStorage(key: KeychainConstants.passcodeKey, encrypted: true)
    private var savedPasscode: String

    private var passcodeEntries = 0

    private let stackView = UIStackView()

    // FIXME: - сделать дизайн PasscodeInputView
    private let topView = PasscodeInputView()
    private let keyboardView = NumberKeyboardView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        interactor?.loadedView()
        interactor?.invalidateBiometricsAuth()
    }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { context in
            if let interfaceOrientation = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.windowScene?.interfaceOrientation {
                if interfaceOrientation.isLandscape {
                    self.stackView.axis = .horizontal
                } else {
                    self.stackView.axis = .vertical
                }
            }
        })
    }

    private func configureSubviews() {
        edgesForExtendedLayout = []
        view.backgroundColor = UIColor.white
        title = Constants.title
        stackView.distribution = .fillEqually

        switch state {
        case .createPassword:
            topView.topText = Constants.topTextCreatePassword
        case .enterPassword:
            topView.topText = Constants.topTextEnterPassword
        }

        topView.numberOfDots = Constants.numberOfDots

        configureKeyboardView()

        // FIXME: - настроить икконку
        if state == .enterPassword {
            let exitButton = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(exit))
            navigationController?.navigationBar.topItem?.leftBarButtonItem = exitButton
        }

        stackView.axis = .vertical
        [topView, keyboardView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview($0)
        }

        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        let constraints = [
            stackView.leadingAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.leadingAnchor, constant: Constants.sidePadding),
            stackView.topAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.topAnchor, constant: Constants.verticalSpacing),
            stackView.trailingAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.trailingAnchor, constant: -Constants.sidePadding),
            stackView.bottomAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.bottomAnchor, constant: -Constants.verticalSpacing)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func configureKeyboardView() {
        keyboardView.action = { [weak self] inputValue in
            guard let self = self else { return }

            if self.topView.passcode.count < Constants.numberOfDots {
                self.topView.passcode = self.topView.passcode + inputValue
            }

            self.checkInput(self.topView.passcode)
        }

        keyboardView.bottomRightButtonAction = { [weak self] in
            guard let self = self else { return }
            if !self.topView.passcode.isEmpty {
                self.topView.passcode.removeLast()
            }
        }

        keyboardView.bottomLeftButtonAction = { [weak self] in
            guard let self = self else { return }
            self.interactor?.handleBiometricAuth()
        }
    }

    @objc
    private func exit() {
        router?.exitTapped()
    }

    private func checkInput(_ input: String) {
        if input.count == Constants.numberOfDots {
            passcodeEntries += 1

            switch state {
            case .createPassword:
                checkInputForCreateState()
            case .enterPassword:
                checkInputForEnterState()
            }
        }
    }

    private func checkInputForCreateState() {
        // FIXME: Refactor code, move to interactor
        if passcodeEntries > 1 {
            if currentPasscode == topView.passcode && !currentPasscode.isEmpty && !topView.passcode.isEmpty {
                savedPasscode = currentPasscode

                FullScreenPreloaderViewPresenter.show()
                interactor?.setPinCode()
            } else {
                // Reset passcode enter counter
                passcodeEntries = 1
                topView.shake()
                resetPasscode()
                // - Show alert that passcode is incorrect
                present(UIAlertController.alertWithOneButton(title: Constants.reEnterPasscodeAlertText), animated: false, completion: nil)
            }
        } else {
            currentPasscode = topView.passcode
            resetPasscode()
        }
    }

    private func checkInputForEnterState() {
        if savedPasscode == topView.passcode.aes256Encrypted ?? "" {
            FullScreenPreloaderViewPresenter.show()
            interactor?.checkPinCode()
        } else {
            present(UIAlertController.alertWithOneButton(title: Constants.wrongPasscodeAlertText), animated: false, completion: nil)
            topView.shake()
            resetPasscode()
        }
    }

    private func resetPasscode() {
        UIView.animate(withDuration: 0.2) {
            self.topView.passcode = ""
        }
    }
}

extension PasscodeVC: PasscodeView {

    func updateAfterBiometricAuth(_ result: BiometricAuthResult) {
        switch result {
        case .success:
            FullScreenPreloaderViewPresenter.show()
            interactor?.checkPinCode()
        case .failure(let error):
            let alert = UIAlertController.alertWithOneButton(title: error.localizedDescription)
            present(alert, animated: true, completion: nil)
        }
    }

    func update(_ viewModel: PasscodeViewModel) {
        if state == .enterPassword {
            keyboardView.leftButtonImage = viewModel.image
            keyboardView.leftButtonVisible = viewModel.buttonVisible
            if viewModel.buttonVisible {
                interactor?.handleBiometricAuth()
            }
        } else {
            keyboardView.leftButtonImage = nil
            keyboardView.leftButtonVisible = false
        }
    }

    func update(_ passwordSuccess: Bool) {
        FullScreenPreloaderViewPresenter.hide()

        if passwordSuccess {
            switch self.state {
            case .createPassword:
                let vc = UIAlertController.alertWithOneButton(title: Constants.successPasscodeSetAlertText, action: {
                    self.interactor?.invalidateBiometricsAuth()
                    self.router?.passcodeCreated()
                })
                present(vc, animated: false, completion: nil)
            case .enterPassword:
                router?.passcodeEnteredCorrectly()
                interactor?.invalidateBiometricsAuth()
            }
        } else {
            let vc = UIAlertController.alertWithOneButton(title: Constants.wrongPasscodeAlertText)
            present(vc, animated: false, completion: nil)
            passcodeEntries = 0
            topView.shake()
            resetPasscode()
        }
    }
}

private enum Constants {
    static let title = NSLocalizedString("passcode_title", comment: "passcode_title")
    static let topTextCreatePassword = NSLocalizedString("create_password", comment: "create_password")
    static let topTextEnterPassword = NSLocalizedString("enter_pin", comment: "enter_pin")
    static let reEnterPasscodeAlertText = NSLocalizedString("re_enter_password", comment: "re_enter_password")
    static let successPasscodeSetAlertText = NSLocalizedString("success_set_password", comment: "success_set_password")
    static let wrongPasscodeAlertText = NSLocalizedString("pin_code_error", comment: "pin_code_error")

    static let verticalSpacing: CGFloat = 16
    static let sidePadding: CGFloat = BiometricsConstants.defaultViewPadding

    static let numberOfDots = 5
}

