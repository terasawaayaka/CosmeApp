//
//  SearchUserResultTableViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/18.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol SearchUserResultTableViewCellDelegate: NSObjectProtocol{
    func touchedUserButton(userModel: UserModel,reviewPostModel: ReviewPostModel)
}
extension SearchUserResultTableViewCellDelegate {
}
// MARK: - Property
class SearchUserResultTableViewCell: BaseTableViewCell {
    weak var delegate: SearchUserResultTableViewCellDelegate? = nil
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBAction func touchedUserButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedUserButton(userModel: userModel,reviewPostModel: reviewPostModel)}
    }
    var userModel: UserModel = UserModel()
    var reviewPostModel: ReviewPostModel = ReviewPostModel()
}
// MARK: - Life cycle
extension SearchUserResultTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
// MARK: - Protocol
extension SearchUserResultTableViewCell {
}
// MARK: - method
extension SearchUserResultTableViewCell {
    func setLayout(){
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
    }
    func updateCell(userModel: UserModel){
        self.userModel = userModel
        userNameLabel.text = userModel.nickname
        if userModel.photo_path == nil {
            profileImageView.image = UIImage(named: "noimage")
        } else {
            if let photo_path = userModel.photo_path {
                if let url = URL(string: photo_path) {
                    profileImageView.af_setImage(withURL: url)
                    
                }
            }
        }
        
    }
}

