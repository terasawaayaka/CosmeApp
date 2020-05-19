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
}
extension ActivityGoodTableViewCellDelegate {
}
// MARK: - Property
class ActivityGoodTableViewCell: BaseTableViewCell {
    weak var delegate: ActivityGoodTableViewCellDelegate? = nil
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var postImageView: UIImageView!
    
}
// MARK: - Life cycle
extension ActivityGoodTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ActivityGoodTableViewCell {
}

// MARK: - method
extension ActivityGoodTableViewCell {
}
