//
//  InputViewBehavior.swift
//  Beauty
//
//  Created by Vitalii Sosin on 03.11.2021.
//

import UIKit

public protocol InputViewBehavior {

    /// Флаг, говорящий о том можно ли применять к полю ввода стандартные экшены
    /// copy/paste/cut и т.д., а так же лонгтап для перемещения курсора или нельзя.
    var allowsEditingActions: Bool { get }

    /// Настройка UITextInputTraits, inputView, inputAccessoryView и других свойств,
    /// необходимых для корректной работы режима.
    func setupTextField(_ textField: UITextField)

    /// Получить сырой, неотформатированный ввод пользователя из поля ввода.
    func rawText(from textField: UITextField) -> String?

    /// Установить сырой текст в поле ввода, текст при этом может быть отформатирован
    /// в соответствии с логикой режима.
    func setRawText(_ text: String?, to textField: UITextField)

    /// Назначение метода точно такое же как в протоколе UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
}
