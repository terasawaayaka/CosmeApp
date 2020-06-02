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
    func touchedThirdProfileButton(indexPath: IndexPath)
}
extension ActivityFollowTableViewCellDelegate {
}
// MARK: - Property
class ActivityFollowTableViewCell: BaseTableViewCell {
    weak var delegate: ActivityFollowTableViewCellDelegate? = nil
    
    @IBOutlet weak var thirdIconImageView: UIImageView!
    @IBAction func touchedThirdProfilePageButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedThirdProfileButton(indexPath: indexPath)
        }
    }
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    var indexPath: IndexPath = IndexPath()
}
// MARK: - Life cycle
extension ActivityFollowTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
// MARK: - Protocol
extension ActivityFollowTableViewCell {
}

// MARK: - method
extension ActivityFollowTableViewCell {
    func setLayout() {
        thirdIconImageView.layer.cornerRadius = thirdIconImageView.frame.height / 2
    }
    func updateCell(noticeModel: NoticeModel) {
        if noticeModel.post_user_name == "" {
            userNameLabel.text = "メンバーがいません"
        } else {
            userNameLabel.text = noticeModel.post_user_name
        }
        if let photo_path = noticeModel.post_user_icon {
            if let url = URL(string: photo_path) {
                thirdIconImageView.af_setImage(withURL: url)
            }
        }
    }
}
