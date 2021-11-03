//
//  TextInputViewBehavior.swift
//  Beauty
//
//  Created by Vitalii Sosin on 03.11.2021.
//

import UIKit

extension InputView {
    /// Поведение для ввода произвольного текста. Может быть использовано для ввода
    /// текста, удовлетворяющего указанным ниже особенностям.
    ///
    /// Особенности/возможности:
    ///   - .numberPad клавиатура
    ///   - нет какого-то специального форматирования ввода
    ///   - не имеет противопоказаний к применению стандартных copy/paste/cut/delete
    ///   - есть возможность задать максимальную длину введенного текста
    ///   - есть возможность задать разрешенный набор символов
    public final class PlainTextBehavior: InputViewBehavior {

        // MARK: - Properties
        private let maximumLength: Int
        private let allowedCharacters: CharacterSet?

        // MARK: - Initializers
        public init(maximumLength: Int = Int.max, allowedCharacters: CharacterSet? = nil) {
            self.maximumLength = maximumLength
            self.allowedCharacters = allowedCharacters
        }

        // MARK: - InputViewBehavior
        public var allowsEditingActions: Bool {
            return true
        }

        public func setupTextField(_ textField: UITextField) {
            textField.autocapitalizationType = .none
            textField.autocorrectionType = .no
            textField.spellCheckingType = .no
            textField.keyboardType = .numberPad
            textField.keyboardAppearance = .default
            textField.returnKeyType = .done
            textField.enablesReturnKeyAutomatically = false
            textField.isSecureTextEntry = false
            textField.inputView = nil
            textField.inputAccessoryView = nil
        }

        public func rawText(from textField: UITextField) -> String? {
            return textField.text
        }

        public func setRawText(_ text: String?, to textField: UITextField) {
            textField.text = text.map {
                // Отфильтровываем все запрещенные символы и обрезаем до максимальной длины
                let filtered: String

                if let allowedCharacters = allowedCharacters {
                    filtered = String($0.unicodeScalars.filter(allowedCharacters.contains))
                } else {
                    filtered = $0
                }

                return filtered.count > maximumLength ? String(filtered.prefix(maximumLength)) : filtered
            }
        }

        public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if let allowedCharacters = allowedCharacters, string.rangeOfCharacter(from: allowedCharacters.inverted) != nil {
                // Введенный текст содержит запрещенные символы
                return false
            }

            let resultText: String

            if let text = textField.text, let range = Range(range, in: text) {
                resultText = text.replacingCharacters(in: range, with: string)
            } else {
                resultText = string
            }

            return resultText.count <= maximumLength
        }
    }

    /// Поведение для ввода форматированного текста, состоящего только из цифр
    ///
    /// Особенности/возможности:
    ///   - .numberPad клавиатура
    ///   - для ввода разрешены только цифры
    ///   - форматирование ввода на основе маски
    ///   - применение стандартных copy/paste/cut/delete нежелательно из-за
    ///     необходимости пересчета положения курсора, которое не всегда можно
    ///     выполнить корректно
    ///   - маска для форматирования задается при инициализации
    public final class PhoneBehavoiur: InputViewBehavior {

        // MARK: - Properties
        private let mask: String

        // MARK: - Initializers
        public init(mask: String) {
            self.mask = mask
        }

        // MARK: - InputViewBehavior
        public var allowsEditingActions: Bool {
            return false
        }

        public func setupTextField(_ textField: UITextField) {
            textField.autocapitalizationType = .none
            textField.autocorrectionType = .no
            textField.spellCheckingType = .no
            textField.keyboardType = .numberPad
            textField.keyboardAppearance = .default
            textField.returnKeyType = .done
            textField.enablesReturnKeyAutomatically = false
            textField.isSecureTextEntry = false
            textField.inputView = nil
            textField.inputAccessoryView = nil
        }

        public func rawText(from textField: UITextField) -> String? {
            return textField.text.map(cleanedString)
        }

        public func setRawText(_ text: String?, to textField: UITextField) {
            textField.text = text.map { formattedString(cleanedString($0)) }
        }

        public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard string.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil else {
                // Введенный текст содержит символы отличные от цифр
                return false
            }

            let rawText: String

            if let text = textField.text, let range = Range(range, in: text) {
                rawText = text.replacingCharacters(in: range, with: string)
            } else {
                rawText = string
            }

            let resultText = formattedString(cleanedString(rawText))

            if resultText != textField.text {
                // Генерируем событие изменения текста
                textField.text = resultText
                textField.sendActions(for: .editingChanged)
            }

            return false
        }

        // MARK: - Methods
        private func cleanedString(_ string: String) -> String {
            return String(string.unicodeScalars.filter(CharacterSet.decimalDigits.contains))
        }

        private func formattedString(_ cleanedString: String) -> String {
            return cleanedString.masked(with: mask)
        }
    }
}
