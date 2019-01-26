//
//  ViewController.swift
//  ONEPIC
//
//  Created by Daeyun Ethan on 24/11/2018.
//  Copyright © 2018 Mash-Up. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uiTestButton: UIButton!
    
    lazy var transitionDelegate = PresentationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transitionDelegate.direction = .bottom
        uiTestButton.addTarget(nil, action: #selector(printTest), for: .touchUpInside)

    }
    
    @objc func printTest() {
//        let tempStoryBoard = UIStoryboard(name: "ChoicePictureOption", bundle: nil)
//        let tempVC = tempStoryBoard.instantiateViewController(withIdentifier: "ChoicePictureOptionViewController")
        
        let tempVC = UIStoryboard(name: "ChoicePictureOption", bundle: nil).instantiateViewController(withIdentifier: "ChoicePictureOptionViewController")
        
        tempVC.transitioningDelegate = transitionDelegate
        tempVC.modalPresentationStyle = .custom
        
        present(tempVC, animated: true)
    }


}

