//
//  KeyboardService.swift
//  Beauty
//
//  Created by Vitalii Sosin on 30.10.2021.
//

import UIKit

public protocol KeyboardService {
    var keyboardHeightChangeAction: ((CGFloat) -> Void)? { get set }
    var keyboardRectChangeAction: ((CGRect) -> Void)? { get set }
}

final class KeyboardServiceImpl: KeyboardService {

    var keyboardHeightChangeAction: ((CGFloat) -> Void)?
    var keyboardRectChangeAction: ((CGRect) -> Void)?

    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification , object:nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification , object:nil)
    }

    @objc
    func keyboardWillShow(notification: NSNotification) {
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        keyboardRectChangeAction?(keyboardRect)
        keyboardHeightChangeAction?(keyboardRect.height)
    }

    @objc
    func keyboardWillHide(notification: NSNotification) {
        keyboardHeightChangeAction?(.zero)
    }
}

