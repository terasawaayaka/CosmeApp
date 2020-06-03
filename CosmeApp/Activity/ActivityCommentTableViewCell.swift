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
    func touchedSecondProfileButton(indexPath: IndexPath)
    func touchedSecondPostPageButton(indexPath: IndexPath)
}
extension ActivityCommentTableViewCellDelegate {
}
// MARK: - Property
class ActivityCommentTableViewCell: BaseTableViewCell {
    weak var delegate: ActivityCommentTableViewCellDelegate? = nil

    @IBOutlet weak var secondIconImageView: UIImageView!
    @IBAction func touchedSecondProfilePageButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedSecondProfileButton(indexPath: indexPath)
        }
    }

    @IBOutlet weak var secondPostImageView: UIImageView!
    @IBAction func touchedSecondPostPageButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedSecondPostPageButton(indexPath: indexPath)
        }
    }

    @IBOutlet weak var userNameLabel: UILabel!
    var indexPath: IndexPath = IndexPath()
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
        if noticeModel.notice_user_name == "" {
            userNameLabel.text = "メンバーがいません"
        } else {
            userNameLabel.text = noticeModel.notice_user_name
        }
        if let photo_path = noticeModel.notice_user_icon {
            if let url = URL(string: photo_path) {
                secondIconImageView.af_setImage(withURL: url)
            }
        }
    }
}
