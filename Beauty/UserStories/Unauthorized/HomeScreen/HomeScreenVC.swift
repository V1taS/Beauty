//
//  HomeScreenVC.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import UIKit

final class HomeScreenVC: UIViewController {

    var interactor: HomeScreenInteractor?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        interactor?.loadedView()
    }

    private func configureSubviews() {
        view.backgroundColor = .black

        let button1 = UIButton(frame: CGRect(x: UIScreen.main.bounds.width / 2,
                                          y: UIScreen.main.bounds.height / 2,
                                          width: 200,
                                            height: 200))
        button1.setTitle("Войти", for: .normal)
        view.addSubview(button1)

        button1.addTarget(self, action: #selector(testRoute1), for: .touchUpInside)

        let button2 = UIButton(frame: CGRect(x: UIScreen.main.bounds.width / 2,
                                          y: (UIScreen.main.bounds.height / 2) - 200,
                                          width: 200,
                                            height: 200))
        button2.setTitle("Регистрация", for: .normal)
        view.addSubview(button2)

        button2.addTarget(self, action: #selector(testRoute2), for: .touchUpInside)
    }

    @objc
    func testRoute1() {
        interactor?.login(username: "", password: "")
    }

    @objc
    func testRoute2() {
        interactor?.registration(username: "", password: "")
    }
}

extension HomeScreenVC: HomeScreenView {
}

private enum Constants {
}
