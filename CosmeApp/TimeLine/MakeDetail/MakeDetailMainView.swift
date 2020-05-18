//
//  MakeDetailMainView.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol MakeDetailMainViewDelegate: NSObjectProtocol{
}
extension MakeDetailMainViewDelegate {
}
// MARK: - Property
class MakeDetailMainView: BaseView {
    weak var delegate: MakeDetailMainViewDelegate? = nil
}
// MARK: - Life cycle
extension MakeDetailMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension MakeDetailMainView {
}
// MARK: - method
extension MakeDetailMainView {
}
