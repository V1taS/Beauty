//
//  DefaultMainPresenter.swift
//  Beauty
//
//  Created by Vitalii Sosin on 30.10.2021.
//  
//

import Foundation

final class DefaultMainPresenter {

    weak var view: MainView?

    init(view: MainView) {
        self.view = view
    }
}

extension DefaultMainPresenter: MainPresenter {
    func handleBanner(_ viewModel: MainBannerViewModel?) {
        let banner = MainBannerViewModel(
            title: "Название акции",
            description: "Тут будет описание Вашей акции!"
        )
        view?.updateBanner(banner)
    }

    func handleInviteDashBoard(_ viewModel: MainInviteDashBoardViewModel?) {
        let inviteDashBoard = MainInviteDashBoardViewModel(
            title: "Пригласи 5 друзей и получи 300 бонусов на счёт",
            titleProgressBar: "2 друга",
            description: "Бонусы будут начислены только в том случае, если пользователь установит приложение по Вашей ссылке и пройдет процесс регистрации.",
            progressBarValue: 0.2
        )
        view?.updateInviteDashBoard(inviteDashBoard)
    }

    func handleHeader(_ viewModel: MainHeaderViewModel?) {
        let header = MainHeaderViewModel(
            name: "Светлана Рублева",
            scores: "$ 272.30",
            description: "Баллы можно потратить на услуги салона."
        )
        view?.updateHeader(header)
    }

    func handleButtonAdmin(_ viewModel: MainButtonAdminViewModel?) {
        let buttonAdmin = MainButtonAdminViewModel(
            colorBg: .clear,
            colorTitle: .black,
            borderColor: .black,
            title: "Администратор"
        )
        view?.updateButtonAdmin(buttonAdmin)
    }
}
