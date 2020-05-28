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
    func touchedSecondProfileButton()
    func touchedSecondPostPageButton()
}
extension ActivityCommentTableViewCellDelegate {
}
// MARK: - Property
class ActivityCommentTableViewCell: BaseTableViewCell {
    weak var delegate: ActivityCommentTableViewCellDelegate? = nil

    @IBOutlet weak var secondIconImageView: UIImageView!
    @IBAction func touchedSecondProfilePageButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedSecondProfileButton()
        }
    }

    @IBOutlet weak var secondPostImageView: UIImageView!
    @IBAction func touchedSecondPostPageButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedSecondPostPageButton()
        }
    }
    @IBOutlet weak var userNameLabel: UILabel!
}
// MARK: - Life cycle
extension ActivityCommentTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
// MARK: - Protocol
extension ActivityCommentTableViewCell {
}

// MARK: - method
extension ActivityCommentTableViewCell {
    func setLayout() {
        secondIconImageView.layer.cornerRadius = secondIconImageView.frame.height / 2
    }
    func updateCell(noticeModel: NoticeModel) {
        userNameLabel.text = noticeModel.id
    }
}
