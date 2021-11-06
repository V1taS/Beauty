//
//  MainVC.swift
//  Beauty
//
//  Created by Vitalii Sosin on 30.10.2021.
//  
//

import UIKit

final class MainVC: CollectionViewController<CollectionViewHolder> {
    
    // MARK: - Internal variables
    var interactor: MainInteractor?
    
    // MARK: - Private variables
    private let headerDataSource = MainHeaderDataSource()
    private let buttonAdminDataSource = MainButtonAdminDataSource()
    private let inviteDashBoardDataSource = MainInviteDashBoardDataSource()
    private let bannerViewDataSource = MainBannerViewDataSource()
    
    // MARK: - Initialization
    init() {
        super.init(container: CollectionViewContainer(
            dataSources: [
                headerDataSource,
                buttonAdminDataSource,
                inviteDashBoardDataSource,
                bannerViewDataSource,
                bannerViewDataSource,
                bannerViewDataSource,
                bannerViewDataSource
            ]
        ))
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        view = CollectionViewHolder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyDefaultBehavior()
    }

    // MARK: - Private func
    private func applyDefaultBehavior() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = UIColor.MainScreen.Background.color
        interactor?.loadedView()
    }

    private func configureHeader(_ mainViewModel: MainHeaderViewModel?) {
        guard let viewModel = mainViewModel else { return }
        headerDataSource.name = viewModel.name
        headerDataSource.scores = viewModel.scores
        headerDataSource.description = viewModel.description
        headerDataSource.actionExitButton = { [weak self] in
            guard let self = self else { return }
            self.interactor?.exitApp()
        }
    }

    private func configureButtonAdmin(_ mainViewModel: MainButtonAdminViewModel?) {
        guard let viewModel = mainViewModel else { return }
        buttonAdminDataSource.colorBg = viewModel.colorBg
        buttonAdminDataSource.colorTitle = viewModel.colorTitle
        buttonAdminDataSource.borderColor = viewModel.borderColor
        buttonAdminDataSource.title = viewModel.title
        buttonAdminDataSource.actionButton = { [weak self] in
            guard let self = self else { return }
            self.interactor?.presentAdmin()
        }
    }

    private func configureInviteDashBoard(_ mainViewModel: MainInviteDashBoardViewModel?) {
        guard let viewModel = mainViewModel else { return }
        inviteDashBoardDataSource.titleText = viewModel.title
        inviteDashBoardDataSource.descriptionText = viewModel.description
        inviteDashBoardDataSource.titleProgressBarText = viewModel.titleProgressBar
        inviteDashBoardDataSource.progressBarValue = viewModel.progressBarValue
        inviteDashBoardDataSource.shareButtonAction = { [weak self] in
            guard let self = self else { return }
            self.interactor?.shareApp()
        }
    }

    private func configureBanner(_ mainViewModel: MainBannerViewModel?) {
        guard let viewModel = mainViewModel else { return }
        bannerViewDataSource.titleText = viewModel.title
        bannerViewDataSource.descriptionText = viewModel.description
    }

    private func updateDataSource() {
        container.reload(shouldReloadCollection: true)
    }
}

extension MainVC: MainView {
    func updateBanner(_ viewModel: MainBannerViewModel?) {
        configureBanner(viewModel)
    }

    func updateInviteDashBoard(_ viewModel: MainInviteDashBoardViewModel?) {
        configureInviteDashBoard(viewModel)
    }

    func updateHeader(_ viewModel: MainHeaderViewModel?) {
        configureHeader(viewModel)
    }

    func updateButtonAdmin(_ viewModel: MainButtonAdminViewModel?) {
        configureButtonAdmin(viewModel)
    }
}

private enum Constants {
}
