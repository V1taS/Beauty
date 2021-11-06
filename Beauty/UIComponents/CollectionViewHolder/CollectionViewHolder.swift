//
//  CollectionViewHolder.swift
//  Beauty
//
//  Created by Vitalii Sosin on 05.11.2021.
//  
//

import UIKit

public final class CollectionViewHolder: UIView, CollectionViewHolderProtocol {

    // MARK: - Internal variables
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CollectionViewHolderFlowLayout())

    // MARK: - Private variables

    // MARK: - Public funcs
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        applyDefaultBehavior()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureLayout()
        applyDefaultBehavior()
    }

    // MARK: - Private funcs
    private func apply() {
    }

    private func configureLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: compatableSafeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func applyDefaultBehavior() {
        apply()
    }
}

private enum Constants {
}
