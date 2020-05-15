//
//  CreateMakeMainView.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol CreateMakeMainViewDelegate: NSObjectProtocol{
}
extension CreateMakeMainViewDelegate {
}
// MARK: - Property
class CreateMakeMainView: BaseView {
    weak var delegate: CreateMakeMainViewDelegate? = nil
}
// MARK: - Life cycle
extension CreateMakeMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension CreateMakeMainView {
}

// MARK: - method
extension CreateMakeMainView {
}
