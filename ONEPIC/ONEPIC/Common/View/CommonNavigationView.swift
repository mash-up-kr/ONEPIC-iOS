//
//  CommonNavigationView.swift
//  ONEPIC
//
//  Created by Daeyun Ethan on 05/02/2019.
//  Copyright © 2019 Mash-Up. All rights reserved.
//

import UIKit

protocol CommonNavigationViewDelegate: class {
    func tabLeftButton()
    func tabRightButton()
    func changePick()
}

class CommonNavigationView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var selectFeedButton: UIButton!

    weak var containerView: UIView?
    weak var delegate: CommonNavigationViewDelegate?

    // MARK: - View Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInitialization()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInitialization()
    }

    func commonInitialization() {
        containerView = Bundle.main.loadNibNamed("CommonNavigationView", owner: self, options: nil)?.first as? UIView

        guard let containerView = containerView else {
            assertionFailure("CommonNavigationView doesn't exist.")
            return
        }

        containerView.frame = bounds
        addSubview(containerView)
    }

    func setNavigationView(title: String, leftImage: UIImage? = nil, rightImage: UIImage? = nil, hiddenSelectButton: Bool = true) {
        setTitle(title: title)
        leftButton.setImage(leftImage, for: .normal)
        rightButton.setImage(rightImage, for: .normal)
        selectFeedButton.isHidden = hiddenSelectButton
    }

    func setTitle(title: String) {
        titleLabel.text = title
    }

    // MARK: - Actions

    @IBAction private func actionLeftButton(_ sender: UIButton) {
        delegate?.tabLeftButton()
    }

    @IBAction private func actionRightButton(_ sender: UIButton) {
        delegate?.tabRightButton()
    }

    @IBAction private func actionSelectFeedButton(_ sender: UIButton) {
        delegate?.changePick()
    }
}
