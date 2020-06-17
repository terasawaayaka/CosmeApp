//
//  YourFollowTableViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/06/16.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol YourFollowTableViewCellDelegate: NSObjectProtocol{
}
extension YourFollowTableViewCellDelegate {
}
// MARK: - Property
class YourFollowTableViewCell: BaseTableViewCell {
    weak var delegate: YourFollowTableViewCellDelegate? = nil
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
}
// MARK: - Life cycle
extension YourFollowTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
// MARK: - Protocol
extension YourFollowTableViewCell {
}
// MARK: - method
extension YourFollowTableViewCell {
    func setLayout() {
        userIcon.layer.cornerRadius = userIcon.frame.width / 2
    }
    func updateCell(userModel: UserModel) {
        if userModel.nickname == "" {
            userName.text = "メンバーがいません"
        } else {
            userName.text = userModel.nickname
        }
        if let photo_path = userModel.photo_path {
            if let url = URL(string: photo_path) {
                userIcon.af_setImage(withURL: url)
            }
        }
    }
}
