//
//  ActivityFollowTableViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/19.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol ActivityFollowTableViewCellDelegate: NSObjectProtocol{
}
extension ActivityFollowTableViewCellDelegate {
}
// MARK: - Property
class ActivityFollowTableViewCell: BaseTableViewCell {
    weak var delegate: ActivityFollowTableViewCellDelegate? = nil
    @IBAction func touchedProfilePageButton(_ sender: UIButton) {
    }
}
// MARK: - Life cycle
extension ActivityFollowTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ActivityFollowTableViewCell {
}

// MARK: - method
extension ActivityFollowTableViewCell {
}
