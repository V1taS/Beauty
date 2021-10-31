//
//  SMSInputVC.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import UIKit

final class SMSInputVC: UIViewController {

    var interactor: SMSInputInteractor?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
    }

    private func configureSubviews() {
        view.backgroundColor = .orange

        let label = UILabel(frame: CGRect(x: UIScreen.main.bounds.width / 2,
                                          y: 0,
                                          width: 200,
                                            height: 200))
        label.text = "CМС подтверждение"
        view.addSubview(label)

        let button1 = UIButton(frame: CGRect(x: UIScreen.main.bounds.width / 2,
                                          y: UIScreen.main.bounds.height / 2,
                                          width: 200,
                                            height: 200))
        button1.setTitle("Продолжить", for: .normal)
        view.addSubview(button1)

        button1.addTarget(self, action: #selector(testRoute1), for: .touchUpInside)
    }

    @objc
    func testRoute1() {
        interactor?.loadedView()
    }
}

extension SMSInputVC: SMSInputView {
}

private enum Constants {
}
