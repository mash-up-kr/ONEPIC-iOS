//
//  MainViewController.swift
//  ONEPIC
//
//  Created by Daeyun Ethan on 05/02/2019.
//  Copyright © 2019 Mash-Up. All rights reserved.
//

import UIKit

protocol FeedShowable: class {

}

class MainViewController: UIViewController {
    enum Mode {
        case showFeedView
        case selectFeedView

        var feedContainerViewBottomMargin: CGFloat {
            switch self {
            case .showFeedView:
                return 0
            case .selectFeedView:
                return 78.0
            }
        }

        var floatingButtonBottomMargin: CGFloat {
            switch self {
            case .showFeedView:
                return 26.0
            case .selectFeedView:
                return 108.0
            }
        }

        var fadeOutImageViewHeight: CGFloat {
            switch self {
            case .showFeedView:
                return 0
            case .selectFeedView:
                return 224.0
            }
        }
    }

    @IBOutlet weak var navigationView: CommonNavigationView!
    @IBOutlet weak var menuContainerView: UIView!
    @IBOutlet weak var feedContainerView: UIView!
    @IBOutlet weak var feedContainerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var feedContainerViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var floatingButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var floatingButtonImageView: UIImageView!
    @IBOutlet weak var gradationBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var fadeOutImageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var dimmedView: UIView!

    var mode: Mode = .showFeedView
    var feedTabBarController: UITabBarController?

    var gradationBottomMargin: CGFloat {
        switch mode {
        case .showFeedView:
            return -view.bounds.height
        case .selectFeedView:
            return 0
        }
    }

    // MARK: - View Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        gradationBottomConstraint.constant = gradationBottomMargin
        navigationView.setNavigationView(title: "My Pick", leftImage: #imageLiteral(resourceName: "icon_menu"), rightImage: #imageLiteral(resourceName: " icon_filter"), hiddenSelectButton: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? UITabBarController {
            feedTabBarController = controller
            feedTabBarController?.tabBar.isHidden = true
        }
    }

    @available(iOS 11.0, *)
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()

        let safeAreaTop = view.safeAreaInsets.top
        if safeAreaTop > 0.0 {
            feedContainerViewHeightConstraint.constant -= safeAreaTop
        }
    }

    // MARK: - View Methods

    // MARK: - Actions

    @IBAction private func actionFloatingButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        mode = sender.isSelected ? .selectFeedView : .showFeedView

        let angle = CGFloat(Double.pi / 4)
        UIView.animateKeyframes(
            withDuration: 0.5,
            delay: 0.0,
            animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25,
                                   animations: {
                                    self.floatingButtonImageView.transform = sender.isSelected ? self.floatingButtonImageView.transform.rotated(by: angle) : self.floatingButtonImageView.transform.rotated(by: -angle)
                })

                UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.4,
                                   animations: {
                                    self.floatingButtonImageView.image = sender.isSelected ?  #imageLiteral(resourceName: "icon_button_cancel") : #imageLiteral(resourceName: "icon_plus_button")
                })

                self.feedContainerViewBottomConstraint.constant = self.mode.feedContainerViewBottomMargin
                self.floatingButtonBottomConstraint.constant = self.mode.floatingButtonBottomMargin
                self.fadeOutImageViewHeightConstraint.constant = self.mode.fadeOutImageViewHeight
                self.gradationBottomConstraint.constant = self.gradationBottomMargin
                UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.5,
                                   animations: {
                                    self.view.layoutIfNeeded()
                })
            })
    }

    @IBAction private func actionCloseMenu(_ sender: UITapGestureRecognizer) {
        showMenuView(false)
    }

    func showMenuView(_ flag: Bool) {
        if flag {
            dimmedView.isHidden = !flag
            dimmedView.alpha = 0
        }

        trailingConstraint.constant = flag ? -menuContainerView.bounds.width : 0
        UIView.animate(withDuration: 0.5, animations: {
            self.dimmedView.alpha = flag ? 1 : 0
            self.view.layoutIfNeeded()
        }) { _ in
            if !flag {
                self.dimmedView.isHidden = true
            }
        }
    }
}

// MARK: - CommonNavigationViewDelegate

extension MainViewController: CommonNavigationViewDelegate {
    func tabLeftButton() {
        showMenuView(true)
    }

    func tabRightButton() {

    }

    func changePick() {

    }
}
