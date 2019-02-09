//
//  FilterViewController.swift
//  ONEPIC
//
//  Created by Daeyun Ethan on 04/02/2019.
//  Copyright © 2019 Mash-Up. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, PopupAnimatable {
    typealias CompleteHandler = ((_ isCanceled: Bool) -> Void)

    @IBOutlet weak var backgroundView: UIView! {
        didSet {
            backgroundView.alpha = 0.0
        }
    }
    @IBOutlet weak var contentView: UIView! {
        didSet {
            contentView.transform = CGAffineTransform(scaleX: defaultAnimationScale, y: defaultAnimationScale)
            contentView.alpha = 0.0
        }
    }
    @IBOutlet weak var cancelButton: UIButton!

    @IBOutlet weak var pickerContainerView: UIView!
     @IBOutlet weak var pickerBackgroundView: UIView!
    @IBOutlet weak var pickerContainerBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var pickerView: UIPickerView!

    var completeHandler: CompleteHandler?

    // MARK: - Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        modalPresentationStyle = .overFullScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        show()
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }

    func popupInit(message: String? = nil, attributedMessage: NSAttributedString? = nil, confirmTitle: String, cancelTitle: String, cancelable: Bool, completeHandler: CompleteHandler?) {
        self.completeHandler = completeHandler
    }

    // MARK: - Etc..

    // MARK: - Selectors

    @IBAction func actionTapBackground(_ sender: UITapGestureRecognizer) {
        cancelButton.sendActions(for: .touchUpInside)
    }

    @IBAction private func actionCancelButton(_ sender: UIButton) {
        dismiss { [weak self] in
            if let completeHandler = self?.completeHandler {
                completeHandler(true)
            }
        }
    }

    @IBAction func actionShowDatePicker(_ sender: UIButton) {
        datePickerView.isHidden = false
        pickerView.isHidden = true
        presentPickerContainer()
    }

    @IBAction func actionShowPicker(_ sender: UIButton) {
        pickerView.isHidden = false
        datePickerView.isHidden = true
        presentPickerContainer()
    }

    @IBAction func dismissPickerContainer(_ sender: UITapGestureRecognizer) {
       pickerBackgroundView.isHidden = true
        pickerContainerBottomConstraint.constant = -200.0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }

    func presentPickerContainer() {
       pickerBackgroundView.isHidden = false
        pickerContainerBottomConstraint.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
}
