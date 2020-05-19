//
//  ActivityCommentTableViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/19.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol ActivityCommentTableViewCellDelegate: NSObjectProtocol{
}
extension ActivityCommentTableViewCellDelegate {
}
// MARK: - Property
class ActivityCommentTableViewCell: BaseTableViewCell {
    weak var delegate: ActivityCommentTableViewCellDelegate? = nil
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var postImageView: UIImageView!
}
// MARK: - Life cycle
extension ActivityCommentTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ActivityCommentTableViewCell {
}

// MARK: - method
extension ActivityCommentTableViewCell {
}
