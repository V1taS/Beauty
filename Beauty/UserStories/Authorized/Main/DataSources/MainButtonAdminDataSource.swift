//
//  MainButtonAdminDataSource.swift
//  Beauty
//
//  Created by Vitalii Sosin on 06.11.2021.
//

import UIKit

final class MainButtonAdminDataSource: CollectionViewDataSource {

    // MARK: - Public variables
    public var isEnabled: Bool = true

    public var colorBg: UIColor? {
        didSet {
            reloadCurrentSectionIfLoaded()
        }
    }

    public var colorTitle: UIColor? {
        didSet {
            reloadCurrentSectionIfLoaded()
        }
    }

    public var title: String? {
        didSet {
            reloadCurrentSectionIfLoaded()
        }
    }

    public var borderColor: UIColor? {
        didSet {
            reloadCurrentSectionIfLoaded()
        }
    }

    public var actionButton: (() -> Void)?

    // MARK: - Internal variables
    var delegate: CollectionViewDataSourceContainerDelegate?

    var numberOfSections: Int {
        return isEnabled ? 1 : 0
    }

    var cellsForRegistration: [AppCollectionViewCell.Type]? {
        return [GenericCollectionViewCell<ButtonView>.self]
    }

    // MARK: - Internal func
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(
            width: collectionView.frame.width - 48,
            height: 48
        )
        return CGSize(width: size.width, height: size.height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithType(
            GenericCollectionViewCell<ButtonView>.self,
            indexPath: indexPath
        )
        cell.customSubview.action = { [weak self] in
            guard let self = self else { return }
            self.actionButton?()
        }

        cell.customSubview.colorBg = colorBg
        cell.customSubview.colorTitle = colorTitle
        cell.customSubview.title = title
        cell.customSubview.borderColor = borderColor
        return cell
    }

    func numberOfItems(inSection section: Int) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
    }
}
