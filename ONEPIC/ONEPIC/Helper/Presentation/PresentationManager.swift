//
//  PresentationManager.swift
//  ONEPIC
//
//  Created by Hyeontae on 26/01/2019.
//  Copyright © 2019 Mash-Up. All rights reserved.
//

import UIKit

class PresentationManager: NSObject {
    var direction: PresentationDircetion = .bottom
}

extension PresentationManager: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
//        let presentationController = PresentationController(presentedViewController: presented,
//                                                            presenting: presenting,
//                                                            direction: direction)
        
        let presentationController = PresentationController(presentedViewController: presented,
                                                            presenting: presenting,
                                                            direction: direction,
                                                            breadthPercent: 0.3)
        
        return presentationController
    }
    
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentationAnimator(direction: direction, isPresentation: true)
    }
    
    func animationController(forDismissed dismissed: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            return PresentationAnimator(direction: direction, isPresentation: false)
    }
}
