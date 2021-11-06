//
//  MainHeaderDataSource.swift
//  Beauty
//
//  Created by Vitalii Sosin on 05.11.2021.
//

import UIKit

final class MainHeaderDataSource: CollectionViewDataSource {

    // MARK: - Public variables
    public var isEnabled: Bool = true

    public var name: String? {
        didSet {
            reloadCurrentSectionIfLoaded()
        }
    }

    public var scores: String? {
        didSet {
            reloadCurrentSectionIfLoaded()
        }
    }

    public var description: String? {
        didSet {
            reloadCurrentSectionIfLoaded()
        }
    }

    public var actionExitButton: (() -> Void)?

    // MARK: - Internal variables
    var delegate: CollectionViewDataSourceContainerDelegate?

    var numberOfSections: Int {
        return isEnabled ? 1 : 0
    }

    var cellsForRegistration: [AppCollectionViewCell.Type]? {
        return [GenericCollectionViewCell<HeaderMainScreenView>.self]
    }

    // MARK: - Internal func
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(
            width: collectionView.frame.width,
            height: 220
        )
        return CGSize(width: size.width, height: size.height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithType(
            GenericCollectionViewCell<HeaderMainScreenView>.self,
            indexPath: indexPath
        )

        cell.customSubview.exitButtonAction = { [weak self] in
            guard let self = self else { return }
            self.actionExitButton?()
        }

        cell.customSubview.name = name
        cell.customSubview.scores = scores
        cell.customSubview.descriptionText = description
        return cell
    }

    func numberOfItems(inSection section: Int) -> Int {
        1
    }
}
