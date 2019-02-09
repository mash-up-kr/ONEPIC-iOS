//
//  FeedCollectionViewCell.swift
//  ONEPIC
//
//  Created by Daeyun Ethan on 09/02/2019.
//  Copyright © 2019 Mash-Up. All rights reserved.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell, ContentFlippable {
    @IBOutlet weak var contentContainerView: UIView!

    @IBOutlet weak var onePicContainerView: UIView!
    @IBOutlet weak var onePicImageView: UIImageView!

    @IBOutlet weak var pickContainerView: UIView!
    @IBOutlet weak var pickImageView: UIImageView!
    @IBOutlet weak var pickDimmedImageView: UIImageView!
    @IBOutlet weak var pickTextLabel: UILabel!

    internal var isFlipped: Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()

        contentContainerView.layer.cornerRadius = 6.0
        onePicImageView.layer.cornerRadius = 4.0

        addGesture()
    }

    func addGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(actionFlipImage))
        contentContainerView.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc private func actionFlipImage(_ sender: UITapGestureRecognizer) {
        flipImage()
    }
}
