//
//  PasscodeInputView.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

public final class PasscodeInputView: UIView {

    // MARK: - Public variables
    public var topText = "" {
        didSet {
            topLabel.text = topText
        }
    }

    public var bottomText = "" {
        didSet {
            bottomLabel.text = bottomText
        }
    }

    public var passcode = "" {
        didSet {
            let countOfCharacters = passcode.count - 1
            guard countOfCharacters <= dots.count - 1 else { return }
            for (index, view) in dots.enumerated() {

                // FIXME: - настроить цвета
                if index <= countOfCharacters {
                    view.backgroundColor = .red
                } else {
                    view.backgroundColor = .gray
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

    private let stackView = UIStackView()
    private let topLabel = UILabel()
    private let dotsHolder = UIStackView()
    private var dots = [UIView]()
    private let bottomLabel = UILabel()

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

    public override func layoutSubviews() {
        super.layoutSubviews()
        dots.forEach {
            let heightValue = $0.frame.size.height == 0 ? Constants.defaultDotSize : $0.frame.size.height
            $0.layer.cornerRadius = heightValue / 2

            // FIXME: - изменить цвет
            $0.backgroundColor = .blue
        }
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
        topLabel.textColor = .black
//        topLabel.font = design.topTextFont

        dots.forEach {
            $0.backgroundColor = .gray
        }
    }

    private func configureLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)

        configureDots()

        [topLabel, dotsHolder, bottomLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview($0)
        }

        let constraints = [
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func configureDots() {
        dotsHolder.arrangedSubviews.forEach { $0.removeFromSuperview() }
        dots = []
        (0..<numberOfDots).forEach { _ in
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .clear

            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: Constants.defaultDotSize),
                view.widthAnchor.constraint(equalToConstant: Constants.defaultDotSize)
            ])
            dotsHolder.addArrangedSubview(view)
            dots.append(view)
        }
    }

    private func applyDefaultBehavior() {
        configureDots()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        dotsHolder.alignment = .center
        dotsHolder.spacing = Constants.defaultDotsPadding
        dotsHolder.distribution = .equalSpacing
        topLabel.applyInfoDesign()
        topLabel.text = topText
        bottomLabel.text = bottomText
        topLabel.numberOfLines = .zero
        bottomLabel.numberOfLines = .zero
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
            $0.backgroundColor = .green
        }
    }
}

private enum Constants {
    static let numberOfDots = 5

    static let defaultDotSize: CGFloat = 12
    static let defaultDotsPadding: CGFloat = 20

    static let shakeAnimationKeyPath = "position"
}

