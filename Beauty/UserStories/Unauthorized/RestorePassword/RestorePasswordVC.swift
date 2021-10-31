//
//  RestorePasswordVC.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import UIKit

final class RestorePasswordVC: UIViewController {

    var interactor: RestorePasswordInteractor?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
    }

    private func configureSubviews() {
        view.backgroundColor = .white
    }
}

extension RestorePasswordVC: RestorePasswordView {
    func displayError() {

    }

    func hideLoadingIndicator() {

    }

    func display() {
        
    }
}

private enum Constants {
}
