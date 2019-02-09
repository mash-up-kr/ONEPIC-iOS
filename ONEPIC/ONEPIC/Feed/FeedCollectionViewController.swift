//
//  FeedCollectionViewController.swift
//  ONEPIC
//
//  Created by Daeyun Ethan on 05/02/2019.
//  Copyright © 2019 Mash-Up. All rights reserved.
//

import UIKit

class FeedCollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setFlowLayout()
        collectionView.layer.drawShadow(color: #colorLiteral(red: 0.3843137255, green: 0.4431372549, blue: 0.4901960784, alpha: 0.26), alpha: 1, x: 5, y: 15, blur: 50, spread: 0, path: nil)
    }

    private func setFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 21.0
        flowLayout.minimumInteritemSpacing = 18.0
        flowLayout.itemSize = CGSize(width: (collectionView.bounds.width - 68) / 3, height: (collectionView.bounds.height - 95) / 5)
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 32.0, left: 16.0, bottom: 0, right: 16.0)

        collectionView.collectionViewLayout = flowLayout
    }
}

// MARK: - Collection View Delegate

extension FeedCollectionViewController: UICollectionViewDelegate {
}

// MARK: - Collection View Data Source

extension FeedCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedCollectionViewCell", for: indexPath) as? FeedCollectionViewCell else {
            assertionFailure("FeedCollectionViewCell doesn't exist.")
            return UICollectionViewCell()
        }

        return cell
    }
}
