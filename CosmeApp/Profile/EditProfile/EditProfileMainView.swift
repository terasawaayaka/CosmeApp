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
    @IBAction func touchedEditIconViewButton(_ sender: UIButton) {
        if let delegate = delegate{delegate.touchedEditIconViewButton()}
    }
    @IBAction func touchedLogoutButton(_ sender: UIButton) {
        if let delegate = delegate{delegate.touchedLogoutButton()}
    }
    
    
    @IBOutlet weak var nameTextField: UITextField!
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
}
