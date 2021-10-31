//
//  OnBoardingVC.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import UIKit

final class OnBoardingVC: UIViewController {

    var interactor: OnBoardingInteractor?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        interactor?.loadedView()
    }

    private func configureSubviews() {
        view.backgroundColor = .blue

        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width / 2,
                                          y: UIScreen.main.bounds.height / 2,
                                          width: 200,
                                            height: 200))
        button.setTitle("OnBoardingVC", for: .normal)
        view.addSubview(button)

        button.addTarget(self, action: #selector(testRoute), for: .touchUpInside)
    }

    @objc
    func testRoute() {
        interactor?.close()
    }
}

extension OnBoardingVC: OnBoardingView {
}

private enum Constants {
}
