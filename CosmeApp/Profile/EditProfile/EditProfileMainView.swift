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
}
extension EditProfileMainViewDelegate {
}
// MARK: - Property
class EditProfileMainView: BaseView {
    weak var delegate: EditProfileMainViewDelegate? = nil
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
