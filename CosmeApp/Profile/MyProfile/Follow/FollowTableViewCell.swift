//
//  FollowTableViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/06/08.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol FollowTableViewCellDelegate: NSObjectProtocol{
}
extension FollowTableViewCellDelegate {
}
// MARK: - Property
class FollowTableViewCell: BaseTableViewCell {
    weak var delegate: FollowTableViewCellDelegate? = nil
}
// MARK: - Life cycle
extension FollowTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension FollowTableViewCell {
}
// MARK: - method
extension FollowTableViewCell {
}
