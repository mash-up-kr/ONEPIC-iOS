//
//  FeedSlideViewCell.swift
//  ONEPIC
//
//  Created by Daeyun Ethan on 06/02/2019.
//  Copyright © 2019 Mash-Up. All rights reserved.
//

import UIKit

class FeedSlideViewCell: UICollectionViewCell, ContentFlippable {
    @IBOutlet weak var contentContainerView: UIView!
    @IBOutlet weak var continentsLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!

    @IBOutlet weak var profileImageView: UIImageView?
    @IBOutlet weak var profileStackView: UIStackView?
    @IBOutlet weak var profileNameLabel: UILabel?
    @IBOutlet weak var progileCountryLabel: UILabel?

    @IBOutlet weak var onePicContainerView: UIView!
    @IBOutlet weak var onePicImageView: UIImageView!

    @IBOutlet weak var pickContainerView: UIView!
    @IBOutlet weak var pickImageView: UIImageView!
    @IBOutlet weak var pickDimmedImageView: UIImageView!
    @IBOutlet weak var pickTextLabel: UILabel!

    internal var isFlipped: Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()

        contentContainerView.layer.cornerRadius = 14.0
        onePicImageView.layer.cornerRadius = 3.0

        addGesture()
    }

    func addGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(actionFlipImage))
        contentContainerView.addGestureRecognizer(tapGestureRecognizer)
    }

    func configure(feedMode: FeedSlideViewController.FeedMode) {
        switch feedMode {
        case .my:
            profileImageView?.isHidden = true
            profileStackView?.isHidden = true
        case .others:
            profileImageView?.isHidden = false
            profileStackView?.isHidden = false
        }
    }

    @objc private func actionFlipImage(_ sender: UITapGestureRecognizer) {
        flipImage()
    }
}
