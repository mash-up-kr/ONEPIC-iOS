//
//  UICollectionViewFlowLayoutExtension.swift
//  ONEPIC
//
//  Created by Daeyun Ethan on 06/02/2019.
//  Copyright © 2019 Mash-Up. All rights reserved.
//

import UIKit

class CenterCollectionLayout: UICollectionViewFlowLayout {
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else {
            return proposedContentOffset
        }

        var offsetAjustment = CGFloat.greatestFiniteMagnitude
        let horizontalCenter = proposedContentOffset.x + (collectionView.bounds.width / 2)

        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: collectionView.bounds.width, height: collectionView.bounds.height)

        guard let array = layoutAttributesForElements(in: targetRect) else {
            return proposedContentOffset
        }

        for attribute in array {
            let itemHorizontalCenter = attribute.center.x
            if abs(itemHorizontalCenter - horizontalCenter) < abs(offsetAjustment) {
                offsetAjustment = itemHorizontalCenter - horizontalCenter
            }
        }

        return CGPoint(x: proposedContentOffset.x + offsetAjustment, y: proposedContentOffset.y)
    }
}
