//
//  RegistrationVC.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import UIKit

final class RegistrationVC: UIViewController {

    var interactor: RegistrationInteractor?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
    }

    private func configureSubviews() {
        view.backgroundColor = .green

        let label = UILabel(frame: CGRect(x: UIScreen.main.bounds.width / 2,
                                          y: 0,
                                          width: 200,
                                            height: 200))
        label.text = "Регистрация"
        view.addSubview(label)



        let button1 = UIButton(frame: CGRect(x: UIScreen.main.bounds.width / 2,
                                          y: UIScreen.main.bounds.height / 2,
                                          width: 200,
                                            height: 200))
        button1.setTitle("Продолжить", for: .normal)
        view.addSubview(button1)

        button1.addTarget(self, action: #selector(testRoute1), for: .touchUpInside)

        let button2 = UIButton(frame: CGRect(x: UIScreen.main.bounds.width / 2,
                                          y: (UIScreen.main.bounds.height / 2) - 200,
                                          width: 200,
                                            height: 200))
        button2.setTitle("Вход", for: .normal)
        view.addSubview(button2)

        button2.addTarget(self, action: #selector(testRoute2), for: .touchUpInside)
    }

    @objc
    func testRoute1() {
        interactor?.confirmCode()
    }

    @objc
    func testRoute2() {
        interactor?.login()
    }
}

extension RegistrationVC: RegistrationView {
}

private enum Constants {
}
