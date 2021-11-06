//
//  CollectionViewHolderFlowLayout.swift
//  Beauty
//
//  Created by Vitalii Sosin on 06.11.2021.
//

import UIKit

public final class CollectionViewHolderFlowLayout: UICollectionViewFlowLayout {
    public override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attrs = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath)
        attrs?.alpha = 1.0
        return attrs
    }

    public override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attrs = super.finalLayoutAttributesForDisappearingItem(at: itemIndexPath)
        attrs?.alpha = 1.0
        return attrs
    }
}
