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
    @IBOutlet weak var navigationView: CommonNavigationView!
    @IBOutlet weak var menuContainerView: UIView!
    @IBOutlet weak var feedContainerView: UIView!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var dimmedView: UIView!

    var feedTabBarController: UITabBarController?

    // MARK: - View Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
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

    // MARK: - Actions

    @IBAction private func actionChangeMode(_ sender: UIButton) {
        feedTabBarController?.selectedIndex = sender.tag
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
