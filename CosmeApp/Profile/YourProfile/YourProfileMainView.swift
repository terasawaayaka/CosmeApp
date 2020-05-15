//
//  YourProfileMainView.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol YourProfileMainViewDelegate: NSObjectProtocol{
}
extension YourProfileMainViewDelegate {
}
// MARK: - Property
class YourProfileMainView: BaseView {
    weak var delegate: YourProfileMainViewDelegate? = nil
}
// MARK: - Life cycle
extension YourProfileMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension YourProfileMainView {
}
// MARK: - method
extension YourProfileMainView {
}
