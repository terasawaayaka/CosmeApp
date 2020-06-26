//
//  EditProfileMainView.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol EditProfileMainViewDelegate: NSObjectProtocol{
    func touchedEditIconViewButton()
    func touchedLogoutButton()
    func touchedAccountDeleteButton()
}
extension EditProfileMainViewDelegate {
}
// MARK: - Property
class EditProfileMainView: BaseView {
    weak var delegate: EditProfileMainViewDelegate? = nil
    //Action
    @IBAction func touchedEditIconViewButton(_ sender: UIButton) {
        if let delegate = delegate{delegate.touchedEditIconViewButton()}
    }
    @IBAction func touchedLogoutButton(_ sender: UIButton) {
        if let delegate = delegate{delegate.touchedLogoutButton()}
    }
    @IBAction func touchedAccountDeleteButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedAccountDeleteButton()
        }
    }
    
    
    //Outlet
    @IBOutlet weak var editNameTextField: UITextField!
    @IBOutlet weak var editUserText: UITextView!
    @IBOutlet weak var iconView: UIImageView!
}
// MARK: - Life cycle
extension EditProfileMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setlayout()
    }

}
// MARK: - Protocol
extension EditProfileMainView {
}
// MARK: - method
extension EditProfileMainView {
    func setlayout() {
        iconView.layer.cornerRadius = iconView.frame.width / 2
    }
    func updateUserName(userModel: UserModel) {
        editNameTextField.text = userModel.nickname
    }
    
    func updateUserText(userModel: UserModel) {
        //editUserText.text = userModel.description
        if userModel.description == "" {
            editUserText.text = "自己紹介文を入力"
        }else{
            editUserText.text = userModel.description
        }
    }
    
    func updateUserIcon(userModel: UserModel) {
        if let url = URL(string: userModel.photo_path ?? "") {
                iconView.af_setImage(withURL: url)
        }
        

}
}
