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
    
    //Outlet
    @IBOutlet weak var editNameTextField: UITextField!
    @IBOutlet weak var iconView: UIImageView!
}
// MARK: - Life cycle
extension EditProfileMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension EditProfileMainView {
}
// MARK: - method
extension EditProfileMainView {
    func updateUserName(userModel: UserModel) {
        editNameTextField.text = userModel.nickname
    }
    func updateUserIcon(userModel: UserModel) {
        if let url = URL(string: userModel.photo_path!) {
            iconView.af_setImage(withURL: url)
        }
    }
}
