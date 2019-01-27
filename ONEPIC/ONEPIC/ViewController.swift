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
        uiTestButton.addTarget(nil, action: #selector(presentPictureOptionModal), for: .touchUpInside)
    }
    
    @objc func presentPictureOptionModal() {
        let uploadPictureOptionModal = UIStoryboard(name: "UploadPictureOption", bundle: nil).instantiateViewController(withIdentifier: "UploadPictureOptionVC")
        uploadPictureOptionModal.transitioningDelegate = transitionDelegate
        uploadPictureOptionModal.modalPresentationStyle = .custom
        present(uploadPictureOptionModal, animated: true)
    }


}

