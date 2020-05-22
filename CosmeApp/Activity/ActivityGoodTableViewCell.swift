//
//  ActivityGoodTableViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/19.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol ActivityGoodTableViewCellDelegate: NSObjectProtocol{
    func touchedProfilePageButton()
    func touchedPostPageButton()
}
extension ActivityGoodTableViewCellDelegate {
}
// MARK: - Property
class ActivityGoodTableViewCell: BaseTableViewCell {
    weak var delegate: ActivityGoodTableViewCellDelegate? = nil
    @IBOutlet weak var iconImageView: UIImageView!
    @IBAction func touchedProfilePageButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedProfilePageButton()
        }
    }
    
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBAction func touchedPostPageButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedPostPageButton()
        }
    }
}
// MARK: - Life cycle
extension ActivityGoodTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
// MARK: - Protocol
extension ActivityGoodTableViewCell {
}

// MARK: - method
extension ActivityGoodTableViewCell {
    func setLayout() {
        iconImageView.layer.cornerRadius = iconImageView.frame.height / 2
    }
}
