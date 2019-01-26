//
//  ChoicePictureOptionViewController.swift
//  ONEPIC
//
//  Created by Hyeontae on 26/01/2019.
//  Copyright © 2019 Mash-Up. All rights reserved.
//

import UIKit

class ChoicePictureOptionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundCorners(layer: self.view.layer, radius: 15.0)
    }
    
    func roundCorners(layer targetLayer: CALayer, radius withRaidus: CGFloat) {
        targetLayer.cornerRadius = withRaidus
        targetLayer.masksToBounds = true // default = false
    }
}
