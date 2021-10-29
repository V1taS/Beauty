//
//  MainVC.swift
//  Beauty
//
//  Created by Vitalii Sosin on 30.10.2021.
//  
//

import UIKit

final class MainVC: UIViewController {

    var interactor: MainInteractor?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        interactor?.loadedView()
    }

    private func configureSubviews() {
        view.backgroundColor = .red
    }
}

extension MainVC: MainView {
}

private enum Constants {
}
