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
    func touchedProfilePageButton(indexPath: IndexPath)
    func touchedPostPageButton(indexPath: IndexPath)
}
extension ActivityGoodTableViewCellDelegate {
}
// MARK: - Property
class ActivityGoodTableViewCell: BaseTableViewCell {
    weak var delegate: ActivityGoodTableViewCellDelegate? = nil
    @IBOutlet weak var iconImageView: UIImageView!
    @IBAction func touchedProfilePageButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedProfilePageButton(indexPath: indexPath)
        }
    }
    
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBAction func touchedPostPageButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedPostPageButton(indexPath: indexPath)
        }
    }
    @IBOutlet weak var userNameLabel: UILabel!
    
    var indexPath: IndexPath = IndexPath()
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
    func updateCell(noticeModel: NoticeModel) {
        if noticeModel.notice_user_name == "" {
            userNameLabel.text = "メンバーがいません"
        } else {
            userNameLabel.text = noticeModel.notice_user_name
        }
        if let photo_path = noticeModel.notice_user_icon {
            if let url = URL(string: photo_path) {
                iconImageView.af_setImage(withURL: url)
            }
        }
    }
}
