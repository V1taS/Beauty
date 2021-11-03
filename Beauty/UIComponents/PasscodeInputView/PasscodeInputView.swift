//
//  PasscodeInputView.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

public final class PasscodeInputView: UIView {

    // MARK: - Public variables
    public var passcode = "" {
        didSet {
            let passcodeCharacters = Array(passcode)
            let countOfCharacters = passcode.count - 1
            guard countOfCharacters <= dots.count - 1 else { return }
            for (index, view) in dots.enumerated() {

                // FIXME: - настроить цвета
                if index <= countOfCharacters {
                    view.backgroundColor = UIColor(hex: 0xC270E0)
                    view.text = String(passcodeCharacters[index])
                } else {
                    view.backgroundColor = .white
                }
            }
        }
    }

    public var numberOfDots = Constants.numberOfDots {
        didSet {
            configureDots()
        }
    }

    // MARK: - Private variables
    private let dotsHolder = UIStackView()
    private var dots = [UILabel]()

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

    public func shake() {

        let midX = dotsHolder.center.x
        let midY = dotsHolder.center.y

        let animation = CABasicAnimation(keyPath: Constants.shakeAnimationKeyPath)
        animation.duration = 0.06
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.delegate = self
        animation.fromValue = CGPoint(x: midX - 10, y: midY)
        animation.toValue = CGPoint(x: midX + 10, y: midY)
        dotsHolder.layer.add(animation, forKey: Constants.shakeAnimationKeyPath)
    }

    // MARK: - Private funcs

    // FIXME: - изменить цвет
    private func apply() {
//        dots.forEach {
//            $0.backgroundColor = UIColor(hex: 0xC270E0)
//        }
    }

    private func configureLayout() {
        dotsHolder.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dotsHolder)

        configureDots()

        let constraints = [
            dotsHolder.leadingAnchor.constraint(equalTo: leadingAnchor),
            dotsHolder.topAnchor.constraint(equalTo: topAnchor),
            dotsHolder.trailingAnchor.constraint(equalTo: trailingAnchor),
            dotsHolder.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func configureDots() {
        dotsHolder.arrangedSubviews.forEach { $0.removeFromSuperview() }
        dots = []
        (0..<numberOfDots).forEach { _ in
            let view = UILabel()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .white
            view.layer.cornerRadius = 8
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor(hex: 0xC270E0).cgColor
            view.clipsToBounds = true
            view.textAlignment = .center
            view.textColor = .white
            view.font = UIFont.systemFont(ofSize: 24, weight: .bold)

            let constraints = [
                view.heightAnchor.constraint(equalToConstant: Constants.defaultDotSize.height),
                view.widthAnchor.constraint(equalToConstant: Constants.defaultDotSize.width)
            ]
            constraints.forEach {
                $0.priority = .defaultHigh
            }
            NSLayoutConstraint.activate(constraints)
            dotsHolder.addArrangedSubview(view)
            dots.append(view)
        }
    }

    private func applyDefaultBehavior() {
        configureDots()
        dotsHolder.alignment = .center
        dotsHolder.spacing = Constants.defaultDotsPadding
        dotsHolder.distribution = .equalSpacing
    }
}

extension PasscodeInputView: CAAnimationDelegate {

    public func animationDidStart(_ anim: CAAnimation) {
        dots.forEach {
            $0.backgroundColor = .red
        }
    }

    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        dots.forEach {
            $0.backgroundColor = UIColor(hex: 0xC270E0)
        }
    }
}

private enum Constants {
    static let numberOfDots = 6
    static var defaultDotSize: CGSize { CGSize(width: 40, height: 60) }
    static let defaultDotsPadding: CGFloat = 16
    static let shakeAnimationKeyPath = "position"
}

