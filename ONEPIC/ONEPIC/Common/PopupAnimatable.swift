//
//  PopupAnimatable.swift
//  ONEPIC
//
//  Created by Daeyun Ethan on 09/02/2019.
//  Copyright © 2019 Mash-Up. All rights reserved.
//

import UIKit

protocol PopupAnimatable: class {
    var defaultAnimationScale: CGFloat { get }
    var defaultAnimationDuration: TimeInterval { get }

    var backgroundView: UIView! { get set }
    var contentView: UIView! { get set }

    func show()
    func dismiss(_ completion: (() -> Void)?)
}

extension PopupAnimatable {
    var defaultAnimationScale: CGFloat {
        return 0.8
    }

    var defaultAnimationDuration: TimeInterval {
        return 0.2
    }

    func show() {
        UIView.animate(withDuration: defaultAnimationDuration, animations: {
            self.backgroundView.alpha = 1.0
            self.contentView.alpha = 1.0
            self.contentView.transform = CGAffineTransform.identity
        })
    }

    func dismiss(_ completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: defaultAnimationDuration, animations: {
            self.contentView.transform = CGAffineTransform(scaleX: self.defaultAnimationScale, y: self.defaultAnimationScale)
            self.contentView.alpha = 0.0
            self.backgroundView.alpha = 0.0
        }, completion: { _ in
            if let viewController = self as? UIViewController {
                viewController.dismiss(animated: false, completion: completion)
            }
        })
    }
}
