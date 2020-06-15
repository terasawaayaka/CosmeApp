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
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userIcon: UIImageView!
}
// MARK: - Life cycle
extension FollowTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
// MARK: - Protocol
extension FollowTableViewCell {
}
// MARK: - method
extension FollowTableViewCell {
    func setLayout(){
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
