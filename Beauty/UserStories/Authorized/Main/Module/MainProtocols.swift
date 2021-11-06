//
//  MainProtocols.swift
//  Beauty
//
//  Created by Vitalii Sosin on 30.10.2021.
//  
//

import Foundation

protocol MainInteractor {
    func loadedView()
    func exitApp()
    func shareApp()
    func presentAdmin()
}

protocol MainPresenter {
    func handleHeader(_ viewModel: MainHeaderViewModel?)
    func handleButtonAdmin(_ viewModel: MainButtonAdminViewModel?)
    func handleInviteDashBoard(_ viewModel: MainInviteDashBoardViewModel?)
    func handleBanner(_ viewModel: MainBannerViewModel?)
}

protocol MainView: AnyObject {
    func updateHeader(_ viewModel: MainHeaderViewModel?)
    func updateButtonAdmin(_ viewModel: MainButtonAdminViewModel?)
    func updateInviteDashBoard(_ viewModel: MainInviteDashBoardViewModel?)
    func updateBanner(_ viewModel: MainBannerViewModel?)
}

protocol MainRouter: AnyObject {
    func exitApp()
    func shareApp()
    func presentAdmin()
}
