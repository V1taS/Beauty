//
//  MainBannerViewDataSource.swift
//  Beauty
//
//  Created by Vitalii Sosin on 06.11.2021.
//

import UIKit

final class MainBannerViewDataSource: CollectionViewDataSource {

    // MARK: - Public variables
    public var isEnabled: Bool = true

    public var titleText: String? {
        didSet {
            reloadCurrentSectionIfLoaded()
        }
    }

    public var descriptionText: String? {
        didSet {
            reloadCurrentSectionIfLoaded()
        }
    }

    // MARK: - Internal variables
    var delegate: CollectionViewDataSourceContainerDelegate?

    var numberOfSections: Int {
        return isEnabled ? 1 : 0
    }

    var cellsForRegistration: [AppCollectionViewCell.Type]? {
        return [GenericCollectionViewCell<BannerView>.self]
    }

    // MARK: - Internal func
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(
            width: collectionView.frame.width - 48,
            height: 98
        )
        return CGSize(width: size.width, height: size.height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithType(
            GenericCollectionViewCell<BannerView>.self,
            indexPath: indexPath
        )
        cell.customSubview.titleText = titleText
        cell.customSubview.descriptionText = descriptionText
        return cell
    }

    func numberOfItems(inSection section: Int) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
    }
}

