//
//  CALayerExtension.swift
//  ONEPIC
//
//  Created by Daeyun Ethan on 06/02/2019.
//  Copyright © 2019 Mash-Up. All rights reserved.
//

import UIKit

extension CALayer {
    func drawShadow(color: UIColor = .black,
                    alpha: Float = 0.5,
                    x: CGFloat = 0,
                    y: CGFloat = 2,
                    blur: CGFloat = 4,
                    spread: CGFloat = 0,
                    path: UIBezierPath? = nil) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowRadius = blur / 2
        if let path = path {
            if spread == 0 {
                shadowOffset = CGSize(width: x, height: y)
            } else {
                let scaleX = (path.bounds.width + (spread * 2)) / path.bounds.width
                let scaleY = (path.bounds.height + (spread * 2)) / path.bounds.height

                path.apply(CGAffineTransform(translationX: x + -spread, y: y + -spread).scaledBy(x: scaleX, y: scaleY))
                shadowPath = path.cgPath
            }
        } else {
            shadowOffset = CGSize(width: x, height: y)
            if spread == 0 {
                shadowPath = nil
            } else {
                let dx = -spread
                let rect = bounds.insetBy(dx: dx, dy: dx)
                shadowPath = UIBezierPath(rect: rect).cgPath
            }
        }
        shouldRasterize = true
        rasterizationScale = UIScreen.main.scale
    }
}
