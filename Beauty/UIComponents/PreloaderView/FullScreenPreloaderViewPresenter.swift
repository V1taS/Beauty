//
//  FullScreenPreloaderViewPresenter.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import UIKit

/// Создает Preloader View. Добавляет поверх любой view на window.
enum FullScreenPreloaderViewPresenter {

    /// Показать PreloaderView с текстом.
    /// Если Preloader view уже есть на экране, при еще одном вызове метода не произойдет добавление нового Preloader view.
    static func show(with text: String = "", alpha: CGFloat = 0.72) {
        let isKeyWindow = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        guard let window = isKeyWindow, ((window.subviews.filter { $0.classForCoder == PreloaderView.self }) as? [PreloaderView])?.count == 0 else { return }
        let preloader = PreloaderView()
        preloader.text = text
        preloader.alpha = alpha
        preloader.startAnimation()

        preloader.translatesAutoresizingMaskIntoConstraints = false
        window.addSubview(preloader)
        window.bringSubviewToFront(preloader)

        NSLayoutConstraint.activate([
            preloader.leadingAnchor.constraint(equalTo: window.leadingAnchor),
            preloader.topAnchor.constraint(equalTo: window.topAnchor),
            preloader.trailingAnchor.constraint(equalTo: window.trailingAnchor),
            preloader.bottomAnchor.constraint(equalTo: window.bottomAnchor)
        ])
    }

    /// Убрать PreloaderView
    static func hide() {
        let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        if let preloaders = (window?.subviews.filter { $0.classForCoder == PreloaderView.self }) as? [PreloaderView] {
            preloaders.forEach { (view) in
                view.stopAnimation()
                view.removeFromSuperview()
            }
        }
    }
}

private enum Constants {
    static let animationDuration = 0.3

    static let defaultTitle = NSLocalizedString("loading_title", comment: "loading_title")
}

