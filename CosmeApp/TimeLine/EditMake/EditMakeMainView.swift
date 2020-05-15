//
//  EditMakeMainView.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol EditMakeMainViewDelegate: NSObjectProtocol{
}
extension EditMakeMainViewDelegate {
}
// MARK: - Property
class EditMakeMainView: BaseView {
    weak var delegate: EditMakeMainViewDelegate? = nil
}
// MARK: - Life cycle
extension EditMakeMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension EditMakeMainView {
}
// MARK: - method
extension EditMakeMainView {
}
