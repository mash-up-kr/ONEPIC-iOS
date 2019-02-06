//
//  FeedSlideViewCell.swift
//  ONEPIC
//
//  Created by Daeyun Ethan on 06/02/2019.
//  Copyright © 2019 Mash-Up. All rights reserved.
//

import UIKit

class FeedSlideViewCell: UICollectionViewCell {
    @IBOutlet weak var contentContainerView: UIView!
    @IBOutlet weak var continentsLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var onePicImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!

    @IBOutlet weak var profileImageView: UIImageView?
    @IBOutlet weak var profileNameLabel: UILabel?
    @IBOutlet weak var progileCountryLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()

        contentContainerView.layer.cornerRadius = 14.0
        onePicImageView.layer.cornerRadius = 3.0
    }
}
