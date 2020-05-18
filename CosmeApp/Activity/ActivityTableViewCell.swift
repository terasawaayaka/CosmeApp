//
//  ActivityTableViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/18.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol ActivityTableViewCellDelegate: NSObjectProtocol{
}
extension ActivityTableViewCellDelegate {
}
// MARK: - Property
class ActivityTableViewCell: BaseTableViewCell {
    weak var delegate: ActivityTableViewCellDelegate? = nil
}
// MARK: - Life cycle
extension ActivityTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ActivityTableViewCell {
}

// MARK: - method
extension ActivityTableViewCell {
}
