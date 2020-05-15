//
//  ActivityMainView.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol ActivityMainViewDelegate: NSObjectProtocol{
}
extension ActivityMainViewDelegate {
}
// MARK: - Property
class ActivityMainView: BaseView {
    weak var delegate: ActivityMainViewDelegate? = nil
}
// MARK: - Life cycle
extension ActivityMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ActivityMainView {
}

// MARK: - method
extension ActivityMainView {
}
