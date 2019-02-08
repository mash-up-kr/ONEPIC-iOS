//
//  FeedSlideViewController.swift
//  ONEPIC
//
//  Created by Daeyun Ethan on 04/02/2019.
//  Copyright © 2019 Mash-Up. All rights reserved.
//

import UIKit

class FeedSlideViewController: UIViewController {
    enum FeedMode {
        case my
        case others
    }

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        }
    }

    var feedMode: FeedMode = .my
    var index: Int = 0

    // MARK: - View Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setFlowLayout()
        collectionView.layer.drawShadow(color: #colorLiteral(red: 0.3843137255, green: 0.4431372549, blue: 0.4901960784, alpha: 0.26), alpha: 1, x: 5, y: 15, blur: 50, spread: 0, path: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scrollToCenter()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }

    private func scrollToCenter() {
        let indexPath = IndexPath(row: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
        collectionView.collectionViewLayout.invalidateLayout()
    }

    private func setFlowLayout() {
        let flowLayout = CenterCollectionLayout()
        flowLayout.minimumLineSpacing = 16.0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.itemSize = CGSize(width: collectionView.bounds.width - 66.0, height: collectionView.bounds.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 33.0, bottom: 0, right: 33.0)

        collectionView.collectionViewLayout = flowLayout
    }

    func getCenterIndex(_ scrollView: UIScrollView) {
        let center = CGPoint(x: scrollView.center.x + scrollView.contentOffset.x, y: scrollView.center.y + scrollView.contentOffset.y)

        if let selected = collectionView.indexPathForItem(at: center) {

            if index != selected.row {
                index = selected.row
            }
        }
    }

    // MARK: - Actions
}

// MARK: - Collection View Delegate

extension FeedSlideViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        getCenterIndex(scrollView)
        scrollToCenter()
    }
}

// MARK: - Collection View Data Source

extension FeedSlideViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedSlideViewCell", for: indexPath) as? FeedSlideViewCell else {
            assertionFailure("FeedSlideViewCell doesn't exist.")
            return UICollectionViewCell()
        }

        cell.configure(feedMode: feedMode)
        return cell
    }
}
