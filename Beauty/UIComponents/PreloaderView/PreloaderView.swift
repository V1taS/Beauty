//
//  PreloaderView.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

/// Preloader View для индикации процесса загрузки данных с сервера.
public final class PreloaderView: UIView {

    public var text = "" {
        didSet {
            bankPreloaderView.text = text
        }
    }

    public var backgroundAlpha: CGFloat = 0.72 {
        didSet {
            alpha = backgroundAlpha
        }
    }

    private let bankPreloaderView = LoadingIndicatorView()
    private let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    func startAnimation() {
        bankPreloaderView.startAnimation()
    }

    func stopAnimation() {
        bankPreloaderView.stopAnimation()
    }

    private func setupView() {
        bankPreloaderView.text = text

        backgroundColor = UIColor.white
        alpha = backgroundAlpha

        [bankPreloaderView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        bringSubviewToFront(bankPreloaderView)

        NSLayoutConstraint.activate([
            bankPreloaderView.centerYAnchor.constraint(equalTo: centerYAnchor),
            bankPreloaderView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}

