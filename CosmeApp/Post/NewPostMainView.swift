//
//  NewPostMainView.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol NewPostMainViewDelegate: NSObjectProtocol{
    func touchedReviewButton()
    func touchedMakeButton()
}
extension NewPostMainViewDelegate {
}
// MARK: - Property
class NewPostMainView: BaseView {
    weak var delegate: NewPostMainViewDelegate? = nil
    @IBOutlet weak var reviewImageView: UIView!
    @IBOutlet weak var makeImageView: UIView!
    
    @IBAction func touchedReviewButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedReviewButton()
        }
    }
    
    @IBAction func touchedMakeButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedMakeButton()
        }
    }
}
// MARK: - Life cycle
extension NewPostMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
// MARK: - Protocol
extension NewPostMainView {
}

// MARK: - method
extension NewPostMainView {
    func setLayout() {
        reviewImageView.layer.borderWidth = 3
        reviewImageView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        reviewImageView.layer.cornerRadius = 30
        makeImageView.layer.borderWidth = 3
        makeImageView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        makeImageView.layer.cornerRadius = 30
    }
}
