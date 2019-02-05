//
//  UIFontExtension.swift
//  ONEPIC
//
//  Created by Daeyun Ethan on 04/02/2019.
//  Copyright © 2019 Mash-Up. All rights reserved.
//

import UIKit

// MARK: - Style Guide

extension UIFont {
    class var textStyle1: UIFont {
        return UIFont.systemFont(ofSize: 18.0, weight: .semibold)
    }

    class var textStyle2: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .regular)
    }

    class var textStyle3: UIFont {
        return UIFont(name: "AppleSDGothicNeoB00", size: 14.0)!
    }
}
