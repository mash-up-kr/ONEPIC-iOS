//
//  ContentFlippable.swift
//  ONEPIC
//
//  Created by Daeyun Ethan on 09/02/2019.
//  Copyright © 2019 Mash-Up. All rights reserved.
//

import UIKit

protocol ContentFlippable: class {
    var contentContainerView: UIView! { get set }
    var onePicContainerView: UIView! { get set }
    var pickContainerView: UIView! { get set }
    var isFlipped: Bool { get set }

    func flipImage()
}

extension ContentFlippable where Self: UICollectionViewCell {
    func flipImage() {
        isFlipped.toggle()
        guard let cardToFlip = isFlipped ? onePicContainerView : pickContainerView,
            let bottomCard = isFlipped ? pickContainerView : onePicContainerView else { return }

        UIView.transition(from: cardToFlip,
                          to: bottomCard,
                          duration: 0.5,
                          options: [.transitionFlipFromRight, .showHideTransitionViews],
                          completion: nil)
    }
}
