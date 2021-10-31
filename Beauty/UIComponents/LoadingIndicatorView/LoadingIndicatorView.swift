//
//  LoadingIndicatorView.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

/// UIView для отображения процесса загрузки
public final class LoadingIndicatorView: UIView {

    public enum Style {
        case small
        case normal
    }

    public var text = "" {
        didSet {
            bottomDescriptionLabel.text = text
        }
    }

    public var style: Style = .normal {
        didSet {
            if style == .normal {
                progressBarHeightConstraint?.isActive = false
            } else {
                progressBarHeightConstraint = progressBar.heightAnchor.constraint(equalToConstant: 32)
                progressBarHeightConstraint?.priority = UILayoutPriority(999)
                progressBarHeightConstraint?.isActive = true
            }
            layoutIfNeeded()
        }
    }

    private var progressBarHeightConstraint: NSLayoutConstraint?
    private let bottomDescriptionLabel = UILabel()
    private let progressBar = UIView()

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

    public func startAnimation() {
        let rotation = CABasicAnimation(keyPath: Constants.propertyKeyPath)
        rotation.toValue = Double.pi * 2
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.isRemovedOnCompletion = false
        rotation.repeatCount = Float.greatestFiniteMagnitude
        progressBar.layer.add(rotation, forKey: Constants.animationKey)
    }

    public func stopAnimation() {
        progressBar.layer.removeAnimation(forKey: Constants.animationKey)
    }

    private func configureLayout() {

        [bottomDescriptionLabel, progressBar].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        NSLayoutConstraint.activate([
            progressBar.topAnchor.constraint(equalTo: topAnchor),
            progressBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            progressBar.trailingAnchor.constraint(equalTo: trailingAnchor),

            progressBar.bottomAnchor.constraint(equalTo: bottomDescriptionLabel.topAnchor),
            bottomDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    // FIXME: - настроить логику
    private func applyDefaultBehavior() {
        bottomDescriptionLabel.numberOfLines = 2
        bottomDescriptionLabel.text = text
        bottomDescriptionLabel.textAlignment = .center

//        progressBar.setProgress(Constants.defaultProgress)
        bottomDescriptionLabel.text = text
        invalidateIntrinsicContentSize()
    }

    private func apply() {
        // FIXME: - настроить цвет
        bottomDescriptionLabel.textColor = .black
//        bottomDescriptionLabel.font = design.infoTextFont
    }
}

private enum Constants {
    static let propertyKeyPath = "transform.rotation.z"
    static let animationKey = "Constants"

    static let defaultProgress: CGFloat = 0.75
}

