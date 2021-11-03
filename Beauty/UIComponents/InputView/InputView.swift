//
//  InputView.swift
//  Beauty
//
//  Created by Vitalii Sosin on 03.11.2021.
//  
//

import UIKit

public protocol InputViewDelegate: AnyObject {
    func inputViewEditingBegan(_ inputView: InputView)
    func inputViewEditingChanged(_ inputView: InputView)
    func inputViewDidEndEditing(_ inputView: InputView)
}

extension InputViewDelegate {
    func inputViewEditingBegan(_ inputView: InputView) { }
    func inputViewEditingChanged(_ inputView: InputView) { }
    func inputViewDidEndEditing(_ inputView: InputView) { }
}

public final class InputView: UIView {

    // MARK: - Public variables
    public weak var delegate: InputViewDelegate?
    public var editingBegan: ((_ text: String?) -> Void)?
    public var editingChanged: ((_ text: String?) -> Void)?
    public var editingDidEnd: ((_ text: String?) -> Void)?

    public var text: String? {
        get {
            return behavior.rawText(from: textField)
        }
        set {
            behavior.setRawText(newValue, to: textField)
        }
    }

    public var behavior: InputViewBehavior = PlainTextBehavior() {
        didSet {
            apply(behavior, previousBehavior: oldValue)
        }
    }

    public var secured: Bool = false {
        didSet {
            textField.isSecureTextEntry = secured
        }
    }

    public var leftView: UIView? {
        didSet {
            textField.leftView = leftView
            textField.leftViewMode = .always
        }
    }

    public var rightView: UIView? {
        didSet {
            textField.rightView = rightView
            textField.rightViewMode = .always
        }
    }

    public var placeholder: String? {
        didSet {
            textField.placeholder = placeholder
        }
    }

    // MARK: - Private variables
    private let textField = UITextField()
    private let rightSpacer = UIView()

    // MARK: - Public funcs
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        applyDefaultBehavior()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureLayout()
        applyDefaultBehavior()
    }

    public func hideKeyboard() {
        textField.resignFirstResponder()
    }

    public func firstResponder() {
        textField.becomeFirstResponder()
    }

    public func isFirstResponder() -> Bool {
        textField.isFirstResponder
    }

    // MARK: - Private funcs
    private func apply(_ behavior: InputViewBehavior, previousBehavior: InputViewBehavior) {
        let rawText = previousBehavior.rawText(from: textField)
        behavior.setupTextField(textField)
        behavior.setRawText(rawText, to: textField)
    }

    private func configureLayout() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)

        NSLayoutConstraint.activate([
            rightSpacer.widthAnchor.constraint(equalToConstant: 24),

            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func applyDefaultBehavior() {
        textField.delegate = self
        textField.addTarget(self, action: #selector(handleEditingChanged), for: .editingChanged)
        textField.addTarget(self, action: #selector(handleEditingBegan), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(handleEditingDidEnd), for: .editingDidEnd)
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.textColor = .black
        textField.rightView = rightSpacer
        textField.rightViewMode = .always
    }

    @objc
    private func handleEditingBegan() {
        delegate?.inputViewEditingBegan(self)
        editingBegan?(text)
    }

    @objc
    private func handleEditingChanged() {
        delegate?.inputViewEditingChanged(self)
        editingChanged?(text)
    }

    @objc
    private func handleEditingDidEnd() {
        delegate?.inputViewDidEndEditing(self)
        editingDidEnd?(text)
    }
}

extension InputView: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return behavior.textField(textField, shouldChangeCharactersIn: range, replacementString: string)
    }
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

private enum Constants {
}
