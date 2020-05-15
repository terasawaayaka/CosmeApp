//
//  CreateReviewMainView.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol CreateReviewMainViewDelegate: NSObjectProtocol{
    func touchedAddImageButton()
    func firstStarButton()
    func secondStarButton()
    func thirdStarButton()
    func fourthStarButton()
    func fifthStarButton()
}
extension CreateReviewMainViewDelegate {
}
// MARK: - Property
class CreateReviewMainView: BaseView {
    weak var delegate: CreateReviewMainViewDelegate? = nil
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBAction func touchedAddImageButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedAddImageButton()
        }
    }
    @IBAction func firstStarButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.firstStarButton()
        }
    }
    @IBAction func secondStarButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.secondStarButton()
        }
    }
    @IBAction func thirdStarButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.thirdStarButton()
        }
    }
    @IBAction func fourthStarButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.fourthStarButton()
        }
    }
    @IBAction func fifthStarButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.fifthStarButton()
        }
    }
    @IBOutlet weak var reviewTextField: UITextField!
    @IBOutlet weak var tagTextField: UITextField!
}
// MARK: - Life cycle
extension CreateReviewMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension CreateReviewMainView {
    
}

// MARK: - method
extension CreateReviewMainView {
}
